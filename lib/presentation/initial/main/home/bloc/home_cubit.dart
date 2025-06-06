import 'dart:ui';

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/handlers/istreak_handler.dart';
import 'package:dsa_learning/domain/services/achievements/iachievements_service.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:dsa_learning/domain/user/iuser.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required IAchievementsService achievementsService,
    required IUserService userService,
    required INavigationUtil navigationUtil,
    required IRewardsService rewardsService,
    required IAudioHandler audioHandler,
    required VoidCallback onInitialized,
    required IStreakHandler streakHandler,
  })  : _achievementsService = achievementsService,
        _userService = userService,
        _navigationUtil = navigationUtil,
        _rewardsService = rewardsService,
        _audioHandler = audioHandler,
        _onInitialized = onInitialized,
        _streakHandler = streakHandler,
        super(const HomeState());

  final IUserService _userService;
  final INavigationUtil _navigationUtil;
  final IRewardsService _rewardsService;
  final IAchievementsService _achievementsService;
  final IStreakHandler _streakHandler;
  final IAudioHandler _audioHandler;
  final VoidCallback _onInitialized;

  bool _lostStreak = false;

  IUser get _user => _userService.user!;

  DateTime get fansLastUpdated => _user.fansUpdatedLast;

  Future<void> init(VoidCallback onLostStreak) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      await _achievementsService.init();
      _lostStreak = _streakHandler.shouldShowLostStreakPopup(
        _achievementsService.streak,
      );
      _achievementsService.achievements.sort((a, b) => a.isLocked ? 1 : -1);
      emit(
        state.copyWith(
          status: HomeStatus.success,
          streak: _achievementsService.streak,
          achievements: _achievementsService.achievements,
          userName: _user.firstName,
          hash: _rewardsService.hash,
          bytes: _rewardsService.bytes,
          vent: _rewardsService.vents,
        ),
      );
      _onInitialized();
      if (_lostStreak) onLostStreak();
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  bool get isSoundEnabled => _userService.user!.sounds;

  void onCloseButtonTap() {
    playAudio();
    _navigationUtil.navigateBack();
  }

  void playAudio() {
    _audioHandler.playButtonSound(isAudioOn: _userService.user!.sounds);
  }

  void onTimerFinished() {
    _rewardsService.updateBalance(vents: 1, updateOnServer: false);
  }

  void onRewardsChanged() {
    emit(
      state.copyWith(
        hash: _rewardsService.hash,
        bytes: _rewardsService.bytes,
        vent: _rewardsService.vents,
      ),
    );
    if (state.vent < 5) {
      init(() {});
    }
  }

  void onAchievementsChanged() {
    _achievementsService.achievements.sort((a, b) => a.isLocked ? 1 : -1);
    emit(
      state.copyWith(
        achievements: _achievementsService.achievements,
        streak: _achievementsService.streak,
      ),
    );
  }

  Future<void> onLostStreakConfirmTap() async {
    try {
      await _rewardsService.useHash();
      _achievementsService.updateStreakWithHash();
      emit(
        state.copyWith(
          hash: _rewardsService.hash,
          streak: _achievementsService.streak,
        ),
      );
      _navigationUtil.navigateBackToStart();
    } catch (error) {
      logger.e(error);
    }
  }
}

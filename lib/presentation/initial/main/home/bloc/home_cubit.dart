import 'dart:ui';

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';
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
  })  : _achievementsService = achievementsService,
        _userService = userService,
        _navigationUtil = navigationUtil,
        _rewardsService = rewardsService,
        super(const HomeState());

  final IUserService _userService;
  final INavigationUtil _navigationUtil;
  final IRewardsService _rewardsService;
  final IAchievementsService _achievementsService;

  bool _lostStreak = false;

  IUser get _user => _userService.user!;

  DateTime get fansLastUpdated => _user.fansUpdatedLast;

  Future<void> init(VoidCallback onLostStreak) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      await _achievementsService.init();
      _lostStreak = shouldShowLostStreakPopup(_achievementsService.streak);
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
          profilePhoto: _user.profilePhoto,
        ),
      );

      if (_lostStreak) onLostStreak();
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  void onCloseButtonTap() {
    _navigationUtil.navigateBack();
  }

  void onUserDataChanged() {
    emit(state.copyWith(profilePhoto: _user.profilePhoto));
  }

  void onTimerFinished() {
    _rewardsService.updateBalance(vents: 1);
  }

  void onRewardsChanged() {
    emit(
      state.copyWith(
        hash: _rewardsService.hash,
        bytes: _rewardsService.bytes,
        vent: _rewardsService.vents,
      ),
    );
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

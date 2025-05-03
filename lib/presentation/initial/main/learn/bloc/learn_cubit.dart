import 'dart:ui';

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/navigation/routes.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:dsa_learning/presentation/initial/main/learn/bloc/learn_state.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/lesson_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearnCubit extends Cubit<LearnState> {
  LearnCubit({
    required IAudioHandler audioHandler,
    required INavigationUtil navigationUtil,
    required ILessonRepository lessonRepository,
    required ILessonService lessonService,
    required IRewardsService rewardsService,
    required bool isSoundOn,
    required VoidCallback onInitialized,
  })  : _audioHandler = audioHandler,
        _navigationUtil = navigationUtil,
        _lessonRepository = lessonRepository,
        _lessonService = lessonService,
        _rewardsService = rewardsService,
        _isSoundOn = isSoundOn,
        _onInitialized = onInitialized,
        super(const LearnState());

  final IAudioHandler _audioHandler;
  final INavigationUtil _navigationUtil;
  final ILessonRepository _lessonRepository;
  final ILessonService _lessonService;
  final IRewardsService _rewardsService;
  final VoidCallback _onInitialized;
  bool _isSoundOn;

  int get vents => _rewardsService.vents;

  bool Function(int) get isLessonOpened => _lessonService.isLessonLearned;

  void playSound() {
    _audioHandler.playButtonSound(_isSoundOn);
  }

  void updateSoundSettings(bool isSoundOn) {
    _isSoundOn = isSoundOn;
  }

  Future<void> init() async {
    try {
      final List<ICategory> summary =
          await _lessonRepository.getLessonsSummary();
      await _lessonService.init();

      final LearnStatus status =
          summary.isNotEmpty ? LearnStatus.loaded : LearnStatus.failure;
      emit(
        state.copyWith(
          lessonsSummary: summary,
          status: status,
        ),
      );
      if (status == LearnStatus.loaded) _onInitialized();
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: LearnStatus.failure));
    }
  }

  void onCloseButtonTap() {
    playSound();
    _navigationUtil.navigateBack();
  }

  void onStartButtonTap(int id, int gameId, String category) {
    playSound();
    _navigationUtil.navigateBack();
    _navigationUtil.navigateTo(
      AppRoutes.routeLesson,
      data: LessonRoutingArgs(
        id: id,
        gameId: gameId,
        category: category,
        onLessonFinished: init,
      ),
    );
  }
}

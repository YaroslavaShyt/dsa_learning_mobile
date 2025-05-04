import 'dart:ui';

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/navigation/routes.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/rewards/achievements/achievement.dart';
import 'package:dsa_learning/data/rewards/rewards.dart';
import 'package:dsa_learning/domain/game/igame.dart';
import 'package:dsa_learning/domain/game/itask.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';
import 'package:dsa_learning/domain/services/achievements/iachievements_service.dart';
import 'package:dsa_learning/domain/services/handlers/sounds/ivibration_handler.dart';
import 'package:dsa_learning/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:dsa_learning/domain/theory/ilesson_theory.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_state.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/lesson_finished_factory.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _progressStep = 0.25;

typedef RewardFunc = void Function(int, int, int);

class LessonCubit extends Cubit<LessonState> {
  LessonCubit({
    required int lessonId,
    required int gameId,
    required ILessonRepository lessonRepository,
    required INavigationUtil navigationUtil,
    required IRewardsService rewardsService,
    required IAchievementsService achievementsService,
    required ILessonService lessonService,
    required IVibrationHandler vibrationHandler,
    required bool isVibrationEnabled,
    required StatisticsCubit statisticsCubit,
    required String categoryName,
    required IAudioHandler audioHandler,
    required bool isSoundEnabled,
    required VoidCallback onLessonFinished,
  })  : _id = lessonId,
        _gameId = gameId,
        _lessonRepository = lessonRepository,
        _navigationUtil = navigationUtil,
        _rewardsService = rewardsService,
        _achievementsService = achievementsService,
        _lessonService = lessonService,
        _vibrationHandler = vibrationHandler,
        _isVibrationEnabled = isVibrationEnabled,
        _statisticsCubit = statisticsCubit,
        _categoryName = categoryName,
        _audioHandler = audioHandler,
        _isSoundEnabled = isSoundEnabled,
        _vents = rewardsService.vents,
        _onLessonFinished = onLessonFinished,
        super(const LessonState());

  final int _id;
  final int _gameId;
  final INavigationUtil _navigationUtil;
  final IRewardsService _rewardsService;
  final ILessonRepository _lessonRepository;
  final IAchievementsService _achievementsService;
  final ILessonService _lessonService;
  final IVibrationHandler _vibrationHandler;
  final bool _isVibrationEnabled;
  final bool _isSoundEnabled;
  final StatisticsCubit _statisticsCubit;
  final String _categoryName;
  final IAudioHandler _audioHandler;
  final VoidCallback _onLessonFinished;

  int _hash = 0;
  int _vents = 0;
  int _bytes = 0;
  List<AchievementType> _achievements = [];

  bool get _isLessonLearned => _lessonService.isLessonLearned(_id);

  bool get isLessonLearned => _isLessonLearned;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: LessonStatus.loading));

      final List<Object?> data = await Future.wait([
        _lessonRepository.getLessonTheory(_id),
        _lessonRepository.getLessonGame(_gameId),
      ]);

      final IGame? game = data.last as IGame?;

      emit(
        state.copyWith(
          gameTime: game?.timeLimit,
          game: game,
          lessonTheory: data.first as ILessonTheory?,
          status: data.first != null && game != null
              ? LessonStatus.loaded
              : LessonStatus.failure,
          vents: _rewardsService.vents,
        ),
      );
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: LessonStatus.failure));
    }
  }

  Future<void> onNextButtonPressed(RewardFunc onTheoryFinished) async {
    _playSound();
    if (state.step == 4) {
      emit(state.copyWith(progress: state.progress + _progressStep));

      _bytes = Rewards.endOfTheoryLesson.bytes;
      _hash = Rewards.endOfTheoryLesson.hash;

      onTheoryFinished(
        _isLessonLearned ? 0 : _bytes,
        _isLessonLearned ? 0 : _hash,
        _isLessonLearned ? 0 : _vents,
      );
      return;
    }
    emit(
      state.copyWith(
        step: state.step + 1,
        progress: state.progress + _progressStep,
      ),
    );
  }

  void _playSound() {
    _audioHandler.playButtonSound(isAudioOn: _isSoundEnabled);
  }

  void onBackButtonPressed(VoidCallback confirmExit) {
    _playSound();

    if (state.activityType == ActivityType.theory) {
      if (state.step > 1) {
        emit(
          state.copyWith(
            step: state.step > 1 ? state.step - 1 : null,
            progress: state.progress - _progressStep,
          ),
        );
        return;
      }
      confirmExit();
      return;
    }
    confirmExit();
  }

  void onUpdateTimer() {
    emit(state.copyWith(theoryTime: state.theoryTime + 1));
  }

  void onUpdateGameTimer() {
    if (state.gameTime > 0) {
      emit(state.copyWith(gameTime: state.gameTime - 1));
    }
  }

  void onConfirmTap() {
    _playSound();
    _navigationUtil.navigateBack(pagesNum: 2);
  }

  void onCancelTap() {
    _playSound();
    _navigationUtil.navigateBack();
  }

  void onLaterTap() {
    _playSound();
    _navigationUtil.navigateBack();
  }

  void onLetsGoTap() {
    _playSound();
    _navigationUtil.navigateBack();
    emit(state.copyWith(activityType: ActivityType.game));
  }

  String get planStep {
    if (state.step == 1) return state.lessonTheory!.lessonPlan.step1;
    if (state.step == 2) return state.lessonTheory!.lessonPlan.step2;
    if (state.step == 3) return state.lessonTheory!.lessonPlan.step3;
    if (state.step == 4) return state.lessonTheory!.lessonPlan.step4;
    return '';
  }

  String get theoryStep {
    if (state.step == 1) return state.lessonTheory!.lessonTheory.theoryStep1;
    if (state.step == 2) return state.lessonTheory!.lessonTheory.theoryStep2;
    if (state.step == 3) return state.lessonTheory!.lessonTheory.theoryStep3;
    if (state.step == 4) return state.lessonTheory!.lessonTheory.theoryStep4;
    return '';
  }

  ITask get task => state.game!.tasks[state.gameStep];

  String _formatTime(int seconds) {
    return DateFormat('mm:ss').format(
      DateTime(0).add(
        Duration(seconds: seconds),
      ),
    );
  }

  void onAnswerSelected(
    String answer,
    VoidCallback onAllVentsUsed, {
    required bool isCorrect,
  }) {
    _playSound();

    if (_rewardsService.vents < 1) {
      onAllVentsUsed();
      return;
    }
    if (!isCorrect) {
      _rewardsService.updateBalance(vents: -1);
    }
    emit(
      state.copyWith(
        selectedAnswer: answer,
        gameCorrectAnswers: state.gameCorrectAnswers + (isCorrect ? 1 : 0),
        gameProgress: [...state.gameProgress, isCorrect],
        vents: _rewardsService.vents,
      ),
    );

    if (_isVibrationEnabled) {
      if (isCorrect) {
        _vibrationHandler.vibratePositive();
        return;
      }
      _vibrationHandler.vibrateNegative();
    }
  }

  Future<void> onNextGameButtonPressed(VoidCallback onAllVentsUsed) async {
    try {
      _playSound();

      if (_rewardsService.vents < 1) {
        onAllVentsUsed();
      }
      if (state.selectedAnswer.isEmpty) return;

      if (state.gameStep == state.game!.tasks.length - 1) {
        final bool isLostPoints =
            state.gameCorrectAnswers < state.game!.tasks.length - 2;

        _achievementsService.updateStreak();

        _bytes += Rewards.endOfGame.bytes * state.gameCorrectAnswers;

        if (state.gameTime > 0) {
          _bytes += 10;
        }

        if (isLostPoints) _bytes = 0;

        final int time =
            (state.game!.timeLimit - state.gameTime) + state.theoryTime;

        final bool isLessonLearned = _lessonService.isLessonLearned(_id);

        if (!isLostPoints) {
          await Future.wait([
            _rewardsService.updateBalance(bytes: _bytes),
            _lessonService.updateLearnedLessons(_id, time, _categoryName),
          ]);
          _checkAchievements();
          _statisticsCubit.init();
        }
        _onLessonFinished();

        _navigationUtil.navigateToAndReplace(
          AppRoutes.routeLessonFinished,
          data: LessonFinishedRoutingArgs(
            isLessonOver: _bytes > 0,
            onToLessonsPressed: _navigationUtil.navigateBackToStart,
            time: _formatTime(time),
            lessonName: state.game?.title ?? '',
            lessonDescription: '',
            isGame: true,
            bytes: isLessonLearned ? 0 : _bytes,
            hash: 0,
            fan: 0,
            achievements: _achievements,
            isVibrationEnabled: _isVibrationEnabled,
            isAudioEnabled: _isSoundEnabled,
            playSound: () => _playSound(),
            vibrate: () => _vibrationHandler.vibrate(repeat: false),
          ),
        );
        return;
      }
      emit(state.copyWith(gameStep: state.gameStep + 1, selectedAnswer: ''));
    } catch (error) {
      logger.e(error);
    }
  }

  void _checkAchievements() {
    final List<AchievementType> achievements = [];
    if (_isSavvyAchieved()) {
      achievements.add(AchievementType.savvy);
    }
    if (_isDevotionAchieved) {
      achievements.add(AchievementType.devotion);
    }
    if (_isJuniorAchieved()) {
      achievements.add(AchievementType.junior);
    }
    if (_isMiddleAchieved()) {
      achievements.add(AchievementType.middle);
    }
    if (_isPersistenceAchieved()) {
      achievements.add(AchievementType.persistence);
    }
    if (_isResponsibilityAchieved()) {
      achievements.add(AchievementType.responsibility);
    }
    if (_isSeniorAchieved()) {
      achievements.add(AchievementType.senior);
    }
    _achievements = achievements;
    _achievementsService.addAchievement(_achievements);
  }

  bool _isSavvyAchieved() =>
      state.gameCorrectAnswers == state.game!.tasks.length;

  bool get _isDevotionAchieved =>
      _achievementsService.isDevotionAchievementReceived();

  bool _isJuniorAchieved() {
    return _lessonService.learnedAlgorithmsLessonsId.length ==
        _lessonService.algorithmsLessonsNum;
  }

  bool _isMiddleAchieved() {
    return _lessonService.learnedDataStructuresLessonsId.length ==
        _lessonService.dataStructuresLessonsNum;
  }

  bool _isPersistenceAchieved() {
    return _lessonService.lessonsCounter == 2;
  }

  bool _isResponsibilityAchieved() {
    int counter = 0;
    for (var streak in _achievementsService.streak) {
      if (streak.status == StreakStatus.frozen ||
          streak.status == StreakStatus.learned) {
        counter += 1;
      }
    }
    return counter == 7;
  }

  bool _isSeniorAchieved() {
    return _lessonService.learnedDataStructuresLessonsId.length ==
            _lessonService.dataStructuresLessonsNum &&
        _lessonService.learnedAlgorithmsLessonsId.length ==
            _lessonService.algorithmsLessonsNum;
  }

  void onVentsChanged() {
    emit(state.copyWith(vents: _rewardsService.vents));
  }

  void onVentsUsedNoTap() {
    _playSound();
    _navigationUtil.navigateBackToStart();
  }
}

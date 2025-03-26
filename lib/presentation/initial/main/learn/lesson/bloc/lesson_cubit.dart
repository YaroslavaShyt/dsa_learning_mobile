import 'dart:ui';

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/navigation/routes.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/rewards/rewards.dart';
import 'package:dsa_learning/domain/game/igame.dart';
import 'package:dsa_learning/domain/game/itask.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:dsa_learning/domain/theory/ilesson_theory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_state.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/lesson_finished_factory.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _progressStep = 0.25;

class LessonCubit extends Cubit<LessonState> {
  LessonCubit({
    required int lessonId,
    required ILessonRepository lessonRepository,
    required INavigationUtil navigationUtil,
    required IRewardsService rewardsService,
  })  : _id = lessonId,
        _lessonRepository = lessonRepository,
        _navigationUtil = navigationUtil,
        _rewardsService = rewardsService,
        super(const LessonState());

  final int _id;
  final ILessonRepository _lessonRepository;
  final INavigationUtil _navigationUtil;
  final IRewardsService _rewardsService;

  Future<void> init() async {
    try {
      final List<Object?> data = await Future.wait([
        _lessonRepository.getLessonTheory(_id),
        _lessonRepository.getLessonGame(_id),
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
        ),
      );
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: LessonStatus.failure));
    }
  }

  void onNextButtonPressed(void Function(int, int, int) onTheoryFinished) {
    if (state.step == 4) {
      emit(state.copyWith(progress: state.progress + _progressStep));

      final int bytes = Rewards.endOfTheoryLesson.bytes;
      final int hash = Rewards.endOfTheoryLesson.hash;
      final int vents = Rewards.endOfTheoryLesson.vents;

      _rewardsService.updateBalance(
        bytes: bytes,
        hash: hash,
        vents: vents,
      );
      onTheoryFinished(bytes, hash, vents);
      return;
    }
    emit(
      state.copyWith(
        step: state.step + 1,
        progress: state.progress + _progressStep,
      ),
    );
  }

  void onBackButtonPressed(VoidCallback confirmExit) {
    if (state.step > 1) {
      emit(
        state.copyWith(
          step: state.step - 1,
          progress: state.progress - _progressStep,
        ),
      );
      return;
    }
    emit(state.copyWith(progress: state.progress - _progressStep));
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
    _navigationUtil.navigateBack(pagesNum: 2);
  }

  void onCancelTap() {
    _navigationUtil.navigateBack();
  }

  void onLaterTap(int bytes, int hash, int vents) {
    _navigationUtil.navigateBack();
    _navigationUtil.navigateToAndReplace(
      AppRoutes.routeLessonFinished,
      data: LessonFinishedRoutingArgs(
        onToLessonsPressed: _navigationUtil.navigateBack,
        time: _formatTime(state.theoryTime),
        lessonName: state.lessonTheory?.lessonTitle ?? '',
        lessonDescription: '',
        isGame: false,
        bytes: bytes,
        hash: hash,
        fan: vents,
        achievements: [],
      ),
    );
  }

  void onLetsGoTap() {
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

  ITask get task {
    return state.game!.tasks[state.gameStep];
  }

  String _formatTime(int seconds) {
    return DateFormat('mm:ss').format(
      DateTime(0).add(
        Duration(seconds: seconds),
      ),
    );
  }

  void onAnswerSelected(String answer) {
    emit(state.copyWith(selectedAnswer: answer));
  }

  void onNextGameButtonPressed() {
    if (state.selectedAnswer.isEmpty) return;

    if (state.gameStep == state.game!.tasks.length - 1) {
      _navigationUtil.navigateToAndReplace(
        AppRoutes.routeLessonFinished,
        data: LessonFinishedRoutingArgs(
          onToLessonsPressed: _navigationUtil.navigateBack,
          time: _formatTime(state.gameTime),
          lessonName: state.game?.title ?? '',
          lessonDescription: '',
          isGame: true,
          bytes: 0,
          hash: 0,
          fan: 0,
          achievements: [],
        ),
      );
      return;
    }
    emit(state.copyWith(gameStep: state.gameStep + 1, selectedAnswer: ''));
  }
}

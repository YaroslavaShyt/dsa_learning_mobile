import 'dart:ui';

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/navigation/routes.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/theory/ilesson_theory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit({
    required int lessonId,
    required ILessonRepository lessonRepository,
    required INavigationUtil navigationUtil,
  })  : _id = lessonId,
        _lessonRepository = lessonRepository,
        _navigationUtil = navigationUtil,
        super(const LessonState());

  final int _id;
  final ILessonRepository _lessonRepository;
  final INavigationUtil _navigationUtil;

  Future<void> init() async {
    try {
      final ILessonTheory? theory =
          await _lessonRepository.getLessonTheory(_id);
      emit(
        state.copyWith(
          lessonTheory: theory,
          status: theory != null ? LessonStatus.loaded : LessonStatus.failure,
        ),
      );
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: LessonStatus.failure));
    }
  }

  void onNextButtonPressed() {
    emit(state.copyWith(step: state.step + 1));
  }

  void onBackButtonPressed(VoidCallback confirmExit) {
    if (state.step > 1) {
      emit(state.copyWith(step: state.step - 1));
      return;
    }
    confirmExit();
  }

  void onPauseButtonTap() {}

  void onConfirmTap() {
    _navigationUtil.navigateBack(pagesNum: 2);
  }

  void onCancelTap() {
    _navigationUtil.navigateBack();
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
}

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/navigation/routes.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/presentation/initial/main/learn/bloc/learn_state.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/lesson_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearnCubit extends Cubit<LearnState> {
  LearnCubit({
    required INavigationUtil navigationUtil,
    required ILessonRepository lessonRepository,
  })  : _navigationUtil = navigationUtil,
        _lessonRepository = lessonRepository,
        super(const LearnState());

  final INavigationUtil _navigationUtil;
  final ILessonRepository _lessonRepository;

  Future<void> init() async {
    try {
      final List<ICategory> summary =
          await _lessonRepository.getLessonsSummary();
      emit(
        state.copyWith(
          lessonsSummary: summary,
          status: summary.isNotEmpty ? LearnStatus.loaded : LearnStatus.failure,
        ),
      );
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: LearnStatus.failure));
    }
  }

  void onCloseButtonTap() {
    _navigationUtil.navigateBack();
  }

  void onStartButtonTap(int id) {
    _navigationUtil.navigateBack();
    _navigationUtil.navigateTo(
      AppRoutes.routeLesson,
      data: LessonRoutingArgs(id: id),
    );
  }
}

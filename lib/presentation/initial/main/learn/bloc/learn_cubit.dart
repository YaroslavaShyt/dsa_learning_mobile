import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/navigation/routes.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:dsa_learning/presentation/initial/main/learn/bloc/learn_state.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/lesson_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearnCubit extends Cubit<LearnState> {
  LearnCubit({
    required INavigationUtil navigationUtil,
    required ILessonRepository lessonRepository,
    required ILessonService lessonService,
    required IRewardsService rewardsService,
  })  : _navigationUtil = navigationUtil,
        _lessonRepository = lessonRepository,
        _lessonService = lessonService,
        _rewardsService = rewardsService,
        super(const LearnState());

  final INavigationUtil _navigationUtil;
  final ILessonRepository _lessonRepository;
  final ILessonService _lessonService;
  final IRewardsService _rewardsService;

  int get vents => _rewardsService.vents;

  Future<void> init() async {
    try {
      final List<ICategory> summary =
          await _lessonRepository.getLessonsSummary();
      await _lessonService.init();

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

  void onStartButtonTap(int id, int gameId, String category) {
    _navigationUtil.navigateBack();
    _navigationUtil.navigateTo(
      AppRoutes.routeLesson,
      data: LessonRoutingArgs(
        id: id,
        gameId: gameId,
        category: category,
      ),
    );
  }
}

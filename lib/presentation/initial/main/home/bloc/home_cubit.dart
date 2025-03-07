import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/services/achievements/iachievements_service.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required IAchievementsService achievementsService,
  })  : _achievementsService = achievementsService,
        super(const HomeState());

  final IAchievementsService _achievementsService;

  Future<void> init() async {
    try {
      await _achievementsService.init();
      emit(
        state.copyWith(
          status: HomeStatus.success,
          streak: _achievementsService.streak,
          lockedAchievements: _achievementsService.lockedAchievements,
          unlockedAchievements: _achievementsService.unlockedAchievements,
        ),
      );
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}

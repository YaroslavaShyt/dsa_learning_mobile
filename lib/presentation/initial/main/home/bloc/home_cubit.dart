import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/services/achievements/iachievements_service.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:dsa_learning/domain/user/iuser.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required IAchievementsService achievementsService,
    required IUserService userService,
    required INavigationUtil navigationUtil,
  })  : _achievementsService = achievementsService,
        _userService = userService,
        _navigationUtil = navigationUtil,
        super(const HomeState());

  final IAchievementsService _achievementsService;
  final IUserService _userService;
  final INavigationUtil _navigationUtil;

  IUser get _user => _userService.user!;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      await _achievementsService.init();
      emit(
        state.copyWith(
          status: HomeStatus.success,
          streak: _achievementsService.streak,
          achievements: _achievementsService.achievements,
          userName: _user.firstName,
          hash: _user.hash,
          bytes: _user.bytes,
          vent: _user.fans,
          profilePhoto: _user.profilePhoto,
        ),
      );
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
}

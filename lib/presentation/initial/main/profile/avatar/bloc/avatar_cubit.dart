import 'dart:ui';

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:dsa_learning/presentation/initial/main/profile/avatar/bloc/avatar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit({
    required INavigationUtil navigationUtil,
    required IRewardsService rewardsService,
    required IUserService userService,
  })  : _userService = userService,
        _rewardsService = rewardsService,
        _navigationUtil = navigationUtil,
        super(const AvatarState());

  final INavigationUtil _navigationUtil;
  final IRewardsService _rewardsService;
  final IUserService _userService;

  bool isEnoughMoney(int price) => _rewardsService.bytes >= price;

  VoidCallback get onCloseButtonTap => _navigationUtil.navigateBackToStart;

  Future<void> onPurchaseButtonTap(String name, int price) async {
    try {
      if (!isEnoughMoney(price)) return;

      if (_userService.user!.unlockedAvatars.contains(name)) return;

      _userService.user!.unlockedAvatars.add(name);

      await Future.wait(
        [
          _rewardsService.updateBalance(bytes: -price),
          _userService.updateUser(
            profilePhoto: name,
            unlockedAvatars: _userService.user!.unlockedAvatars,
          ),
        ],
      );
      _navigationUtil.navigateBackToStart();
    } catch (error) {
      logger.e(error);
    }
  }
}

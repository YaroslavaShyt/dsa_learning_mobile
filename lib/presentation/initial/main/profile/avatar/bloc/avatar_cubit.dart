import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:dsa_learning/presentation/initial/main/profile/avatar/avatar_screen.dart';
import 'package:dsa_learning/presentation/initial/main/profile/avatar/bloc/avatar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit({
    required INavigationUtil navigationUtil,
    required IRewardsService rewardsService,
    required IUserService userService,
    required IAudioHandler audioHandler,
  })  : _userService = userService,
        _rewardsService = rewardsService,
        _navigationUtil = navigationUtil,
        _audioHandler = audioHandler,
        super(const AvatarState());

  final INavigationUtil _navigationUtil;
  final IRewardsService _rewardsService;
  final IUserService _userService;
  final IAudioHandler _audioHandler;

  List<Map<String, dynamic>> get avatars => _avatars;
  final List<Map<String, dynamic>> _avatars = [
    {'name': Avatars.first, 'price': 0, 'isBought': true},
    {'name': Avatars.second, 'price': 100, 'isBought': false},
    {'name': Avatars.third, 'price': 150, 'isBought': false},
    {'name': Avatars.fourth, 'price': 2000, 'isBought': false},
  ];

  bool isEnoughMoney(int price) => _rewardsService.bytes >= price;

  void onCloseButtonTap() {
    _audioHandler.playButtonSound(isAudioOn: _userService.user!.sounds);
    _navigationUtil.navigateBackToStart();
  }

  String get selectedAvatar => _userService.user!.profilePhoto;

  void init() {
    for (var i = 0; i < _avatars.length; i++) {
      final Avatars avatar = _avatars[i]['name'];
      if (_userService.user!.unlockedAvatars.contains(avatar.name)) {
        _avatars[i]['isBought'] = true;
      }
    }
  }

  Future<void> onPurchaseButtonTap(String name, int price) async {
    try {
      if (!isEnoughMoney(price)) return;

      if (_userService.user!.unlockedAvatars.contains(name)) return;

      _userService.user!.unlockedAvatars.add(name);

      await Future.wait(
        [
          _rewardsService.updateBalance(bytes: -price),
          _userService.updateUser(
            profilePhoto: Avatars.values
                .firstWhere((avatar) => avatar.name == name)
                .lottie,
            unlockedAvatars: _userService.user!.unlockedAvatars,
          ),
        ],
      );
      _navigationUtil.navigateBackToStart();
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> changeAvatar(String name) async {
    try {
      _userService.updateUser(
        profilePhoto: Avatars.values
            .firstWhere(
              (avatar) => avatar.name == name,
            )
            .lottie,
      );
      _navigationUtil.navigateBackToStart();
    } catch (error) {
      logger.e(error);
    }
  }
}

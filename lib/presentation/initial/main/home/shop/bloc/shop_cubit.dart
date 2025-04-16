import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/bloc/shop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const int _hashPrice = 50;
const int _ventsPrice = 10;

class ShopCubit extends Cubit<ShopState> {
  ShopCubit({
    required bool isSoundEnabled,
    required IRewardsService rewardsService,
    required INavigationUtil navigationUtil,
    required IAudioHandler audioHandler,
  })  : _rewardsService = rewardsService,
        _navigationUtil = navigationUtil,
        _audioHandler = audioHandler,
        _isSoundEnabled = isSoundEnabled,
        super(const ShopState());

  final IRewardsService _rewardsService;
  final INavigationUtil _navigationUtil;
  final IAudioHandler _audioHandler;
  final bool _isSoundEnabled;

  bool get isButtonActive => state.selectedHash > 0 || state.selectedVents > 0;

  void init() {
    emit(
      state.copyWith(
        bytesBalance: _rewardsService.bytes,
        hashBalance: _rewardsService.hash,
        ventsBalance: _rewardsService.vents,
      ),
    );
  }

  void onVentsIncrement() {
    if (_rewardsService.vents > 5) return;

    if (state.selectedVents + 1 > 5 ||
        (state.selectedVents + 1) * _ventsPrice > state.bytesBalance) {
      return;
    }

    emit(
      state.copyWith(
        ventsBalance: state.ventsBalance + 1,
        bytesBalance: state.bytesBalance - _ventsPrice,
        selectedVents: state.selectedVents + 1,
        totalBytes: state.totalBytes + _ventsPrice,
      ),
    );
  }

  void onVentsDecrement() {
    if (state.selectedVents < 1) {
      return;
    }

    emit(
      state.copyWith(
        ventsBalance: state.ventsBalance - 1,
        bytesBalance: state.bytesBalance + _ventsPrice,
        selectedVents: state.selectedVents - 1,
        totalBytes: state.totalBytes - _ventsPrice,
      ),
    );
  }

  void onHashIncrement() {
    if (state.selectedHash > 10 ||
        (state.selectedHash + 1) * _hashPrice > state.bytesBalance) {
      return;
    }

    emit(
      state.copyWith(
        hashBalance: state.hashBalance + 1,
        selectedHash: state.selectedHash + 1,
        totalBytes: state.totalBytes + _hashPrice,
        bytesBalance: state.bytesBalance - _hashPrice,
      ),
    );
  }

  void onHashDecrement() {
    if (state.selectedHash < 1) {
      return;
    }

    emit(
      state.copyWith(
        hashBalance: state.hashBalance - 1,
        selectedHash: state.selectedHash - 1,
        totalBytes: state.totalBytes - _hashPrice,
        bytesBalance: state.bytesBalance + _hashPrice,
      ),
    );
  }

  Future<void> onConfirmButtonPressed() async {
    try {
      if (state.selectedVents == 0 && state.selectedHash == 0) return;

      _audioHandler.playButtonSound(_isSoundEnabled);

      emit(state.copyWith(isPurchaseInProgress: true));

      await _rewardsService.buyReward(
        hash: state.selectedHash,
        vents: state.selectedVents,
      );

      _navigationUtil.navigateBackToStart();
    } catch (error) {
      logger.e(error);
    }
  }

  void onCloseButtonTap() {
    _audioHandler.playButtonSound(_isSoundEnabled);

    _navigationUtil.navigateBack();
  }
}

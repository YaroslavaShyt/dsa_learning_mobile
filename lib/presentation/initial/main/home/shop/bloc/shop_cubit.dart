import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/bloc/shop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const int _hashPrice = 50;
const int _ventsPrice = 10;

class ShopCubit extends Cubit<ShopState> {
  ShopCubit({
    required IRewardsService rewardsService,
    required INavigationUtil navigationUtil,
  })  : _rewardsService = rewardsService,
        _navigationUtil = navigationUtil,
        super(const ShopState());

  final IRewardsService _rewardsService;
  final INavigationUtil _navigationUtil;

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
    if (state.selectedVents > 10 ||
        (state.selectedVents + 1) * _ventsPrice > state.bytesBalance) {
      return;
    }

    emit(
      state.copyWith(
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
        hashBalance: state.hashBalance - _hashPrice,
        selectedVents: state.selectedHash + 1,
        totalBytes: state.totalBytes + _hashPrice,
      ),
    );
  }

  void onHashDecrement() {
    if (state.selectedHash < 1) {
      return;
    }

    emit(
      state.copyWith(
        hashBalance: state.hashBalance + _hashPrice,
        selectedHash: state.selectedHash - 1,
        totalBytes: state.totalBytes - _hashPrice,
      ),
    );
  }

  void onConfirmButtonPressed() {}

  void onCloseButtonTap() {
    _navigationUtil.navigateBack();
  }
}

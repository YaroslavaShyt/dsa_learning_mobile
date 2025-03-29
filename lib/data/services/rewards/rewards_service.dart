import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/services/rewards/rewards_state.dart';
import 'package:dsa_learning/domain/rewards/irewards_repository.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const int _hashPrice = 50;
const int _ventsPrice = 10;

class RewardsService extends Cubit<RewardsState> implements IRewardsService {
  RewardsService({
    required IRewardsRepository rewardsRepository,
  })  : _rewardsRepository = rewardsRepository,
        super(const RewardsState());

  final IRewardsRepository _rewardsRepository;

  @override
  int get bytes => state.bytes;

  @override
  int get hash => state.hash;

  @override
  int get vents => state.vents;

  @override
  void init({
    required int bytes,
    required int hash,
    required int vents,
  }) {
    emit(
      state.copyWith(
        bytes: bytes,
        hash: hash,
        vents: vents,
      ),
    );
  }

  @override
  Future<void> updateBalance({
    int bytes = 0,
    int hash = 0,
    int vents = 0,
  }) async {
    try {
      final int newBytes = state.bytes + bytes;
      final int newHash = state.hash + hash;
      final int newVents = state.vents + vents;

      emit(
        state.copyWith(
          bytes: newBytes,
          hash: newHash,
          vents: newVents,
        ),
      );

      await _rewardsRepository.update(
        bytes: newBytes,
        hash: newHash,
        vents: newVents,
      );
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> buyReward({
    int hash = 0,
    int vents = 0,
  }) async {
    try {
      final int minusBytes = hash * _hashPrice + vents * _ventsPrice;

      await updateBalance(
        hash: hash,
        vents: vents,
        bytes: state.bytes - minusBytes,
      );
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  void resetData() {
    emit(
      state.copyWith(
        hash: 0,
        vents: 0,
        bytes: 0,
      ),
    );
  }
}

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
  int get bytes => state.bytes < 0 ? 0 : state.bytes;

  @override
  int get hash => state.hash < 0 ? 0 : state.hash;

  @override
  int get vents => state.vents < 0 ? 0 : state.vents;

  @override
  void init({
    required int bytes,
    required int hash,
    required int vents,
  }) {
    emit(
      state.copyWith(
        bytes: bytes < 0 ? 0 : bytes,
        hash: hash < 0 ? 0 : hash,
        vents: vents <= 5
            ? vents < 0
                ? 0
                : vents
            : 5,
      ),
    );
  }

  @override
  Future<void> updateBalance({
    int? bytes,
    int? hash,
    int? vents,
    bool updateOnServer = true,
  }) async {
    try {
      final int newBytes = state.bytes + (bytes ?? 0);
      final int newHash = state.hash + (hash ?? 0);
      final int newVents = state.vents + (vents ?? 0);

      emit(
        state.copyWith(
          bytes: newBytes < 0 ? 0 : newBytes,
          hash: newHash < 0 ? 0 : newHash,
          vents: newVents > 5
              ? 5
              : newVents < 0
                  ? 0
                  : newVents,
        ),
      );

      if (!updateOnServer) return;
      await _rewardsRepository.update(
        bytes: state.bytes,
        hash: state.hash,
        vents: state.vents,
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

      await _rewardsRepository.update(
        bytes: state.bytes - minusBytes,
        hash: hash,
        vents: vents,
      );

      emit(
        state.copyWith(
          bytes: state.bytes - minusBytes,
          hash: hash == 0 ? state.hash : hash,
          vents: vents == 0 ? state.vents : vents,
        ),
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

  @override
  Future<void> useHash() async {
    if (state.hash > 0) {
      emit(state.copyWith(hash: state.hash - 1));

      await _rewardsRepository.update(
        bytes: state.bytes,
        hash: state.hash,
        vents: state.vents,
      );
    }
  }
}

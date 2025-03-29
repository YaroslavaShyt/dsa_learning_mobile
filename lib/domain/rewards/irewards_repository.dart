abstract interface class IRewardsRepository {
  Future<void> update({
    required int bytes,
    required int hash,
    required int vents,
  });
}

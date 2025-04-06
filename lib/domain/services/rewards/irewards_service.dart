enum RewardType { bytes, hash, vents }

abstract interface class IRewardsService {
  int get bytes;

  int get hash;

  int get vents;

  void init({
    required int bytes,
    required int hash,
    required int vents,
  });

  Future<void> buyReward({
    int hash = 0,
    int vents = 0,
  });

  Future<void> updateBalance({
    int? bytes,
    int? hash,
    int? vents,
    bool updateOnServer,
  });

  void resetData();

  Future<void> useHash();
}

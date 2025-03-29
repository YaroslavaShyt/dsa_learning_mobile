import 'package:equatable/equatable.dart';

class ShopState extends Equatable {
  const ShopState({
    this.bytesBalance = 0,
    this.hashBalance = 0,
    this.ventsBalance = 0,
    this.selectedHash = 0,
    this.selectedVents = 0,
    this.totalBytes = 0,
    this.isPurchaseInProgress = false,
  });

  ShopState copyWith({
    int? bytesBalance,
    int? hashBalance,
    int? ventsBalance,
    int? selectedVents,
    int? selectedHash,
    int? totalBytes,
    bool? isPurchaseInProgress,
  }) {
    return ShopState(
      bytesBalance: bytesBalance ?? this.bytesBalance,
      hashBalance: hashBalance ?? this.hashBalance,
      ventsBalance: ventsBalance ?? this.ventsBalance,
      selectedVents: selectedVents ?? this.selectedVents,
      selectedHash: selectedHash ?? this.selectedHash,
      totalBytes: totalBytes ?? this.totalBytes,
      isPurchaseInProgress: isPurchaseInProgress ?? this.isPurchaseInProgress,
    );
  }

  final int bytesBalance;
  final int hashBalance;
  final int ventsBalance;

  final int selectedVents;
  final int selectedHash;
  final int totalBytes;
  final bool isPurchaseInProgress;

  @override
  List<Object?> get props => [
        bytesBalance,
        hashBalance,
        ventsBalance,
        selectedVents,
        selectedHash,
        totalBytes,
      ];
}

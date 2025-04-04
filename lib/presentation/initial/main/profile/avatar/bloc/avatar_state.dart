import 'package:equatable/equatable.dart';

class AvatarState extends Equatable {
  const AvatarState({
    this.isPurchaseInProgress = false,
  });

  final bool isPurchaseInProgress;

  AvatarState copyWith({
    bool? isPurchaseInProgress,
  }) {
    return AvatarState(
      isPurchaseInProgress: isPurchaseInProgress ?? this.isPurchaseInProgress,
    );
  }

  @override
  List<Object?> get props => [
        isPurchaseInProgress,
      ];
}

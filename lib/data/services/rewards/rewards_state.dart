import 'package:equatable/equatable.dart';

class RewardsState extends Equatable {
  const RewardsState({
    this.bytes = 0,
    this.hash = 0,
    this.vents = 0,
  });

  RewardsState copyWith({
    int? hash,
    int? bytes,
    int? vents,
  }) {
    return RewardsState(
      hash: hash ?? this.hash,
      bytes: bytes ?? this.bytes,
      vents: vents ?? this.vents,
    );
  }

  final int hash;
  final int bytes;
  final int vents;

  @override
  List<Object?> get props => [
        bytes,
        hash,
        vents,
      ];
}

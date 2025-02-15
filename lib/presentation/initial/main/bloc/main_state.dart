import 'package:equatable/equatable.dart';

class MainState extends Equatable {
  const MainState({
    this.selectedIndex = 0,
  });

  MainState copyWith({
    int? selectedIndex,
  }) {
    return MainState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  final int selectedIndex;

  @override
  List<Object?> get props => [
        selectedIndex,
      ];
}

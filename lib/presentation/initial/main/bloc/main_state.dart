import 'package:equatable/equatable.dart';

class MainState extends Equatable {
  const MainState({
    this.selectedIndex = 0,
    this.isReadyForOnboarding = false,
    this.isTutorialStarted = false,
  });

  MainState copyWith({
    int? selectedIndex,
    bool? isReadyForOnboarding,
    bool? isTutorialStarted,
  }) {
    return MainState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isTutorialStarted: isTutorialStarted ?? this.isTutorialStarted,
      isReadyForOnboarding: isReadyForOnboarding ?? this.isReadyForOnboarding,
    );
  }

  final int selectedIndex;
  final bool isReadyForOnboarding;
  final bool isTutorialStarted;

  @override
  List<Object?> get props => [
        selectedIndex,
        isReadyForOnboarding,
        isTutorialStarted,
      ];
}

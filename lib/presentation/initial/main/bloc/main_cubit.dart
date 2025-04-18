import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/presentation/initial/main/bloc/main_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required this.isAudioEnabled,
    required IAudioHandler audioHandler,
    required StatisticsCubit statisticsCubit,
  })  : _audioHandler = audioHandler,
        _statisticsCubit = statisticsCubit,
        super(const MainState());

  bool isAudioEnabled;
  final IAudioHandler _audioHandler;
  final StatisticsCubit _statisticsCubit;

  bool _isHomeLoaded = false;
  bool _isLearnLoaded = false;
  bool _isProfileLoaded = false;

  void init() {
    _statisticsCubit.init();
  }

  void startTutorial() {
    emit(state.copyWith(isTutorialStarted: true));
  }

  void onTabsInitialized({
    bool? isHomeLoaded,
    bool? isLearnLoaded,
    bool? isProfileLoaded,
  }) {
    if (isHomeLoaded != null) _isHomeLoaded = isHomeLoaded;
    if (isLearnLoaded != null) _isLearnLoaded = isLearnLoaded;
    if (isProfileLoaded != null) _isProfileLoaded = isProfileLoaded;

    emit(
      state.copyWith(
        isReadyForOnboarding:
            _isHomeLoaded && _isLearnLoaded && _isProfileLoaded,
      ),
    );
  }

  void updateSoundSettings(bool isSoundEnabled) {
    isAudioEnabled = isSoundEnabled;
  }

  void onTabChanged(int index) {
    _audioHandler.playButtonSound(isAudioEnabled);
    emit(state.copyWith(selectedIndex: index));
  }
}

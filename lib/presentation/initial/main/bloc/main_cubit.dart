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

  void init() {
    _statisticsCubit.init();
  }

  void updateSoundSettings(bool isSoundEnabled) {
    isAudioEnabled = isSoundEnabled;
  }

  void onTabChanged(int index) {
    _audioHandler.playButtonSound(isAudioEnabled);
    emit(state.copyWith(selectedIndex: index));
  }
}

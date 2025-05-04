import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:dsa_learning/presentation/initial/main/bloc/main_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required IAudioHandler audioHandler,
    required StatisticsCubit statisticsCubit,
    required IUserService userService,
  })  : _audioHandler = audioHandler,
        _statisticsCubit = statisticsCubit,
        _userService = userService,
        _isAudioEnabled = userService.user!.sounds,
        super(const MainState());

  final IAudioHandler _audioHandler;
  final StatisticsCubit _statisticsCubit;
  final IUserService _userService;

  bool _isHomeLoaded = false;
  bool _isLearnLoaded = false;
  bool _isProfileLoaded = false;

  bool get isAudioEnabled => _isAudioEnabled;
  bool _isAudioEnabled;

  bool get shouldShowTutorial => !_userService.user!.isOnboarded;

  void init() {
    _statisticsCubit.init();
  }

  void startTutorial() {
    emit(state.copyWith(isTutorialStarted: true));
  }

  void finishTutorial() {
    _userService.updateUser(isOnboarded: true);
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

  void updateSoundSettings({required bool isSoundEnabled}) {
    _isAudioEnabled = isSoundEnabled;
  }

  void onTabChanged(int index) {
    _audioHandler.playButtonSound(isAudioOn: _isAudioEnabled);
    emit(state.copyWith(selectedIndex: index));
  }
}

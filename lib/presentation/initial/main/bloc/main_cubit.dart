import 'package:dsa_learning/presentation/initial/main/bloc/main_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required StatisticsCubit statisticsCubit,
  })  : _statisticsCubit = statisticsCubit,
        super(const MainState());

  final StatisticsCubit _statisticsCubit;

  void init() {
    _statisticsCubit.init();
  }

  void onTabChanged(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}

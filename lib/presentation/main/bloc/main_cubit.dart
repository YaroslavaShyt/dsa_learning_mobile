import 'package:dsa_learning/presentation/main/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit() : super(const MainState());

  void onTabChanged(int index){
    emit(state.copyWith(selectedIndex: index));
  }
}
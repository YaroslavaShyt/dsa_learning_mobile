import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/navigation/routes.dart';
import 'package:dsa_learning/presentation/initial/main/learn/bloc/learn_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearnCubit extends Cubit<LearnState> {
  LearnCubit({
    required INavigationUtil navigationUtil,
  })  : _navigationUtil = navigationUtil,
        super(LearnState());

  final INavigationUtil _navigationUtil;

  void onCloseButtonTap() {
    _navigationUtil.navigateBack();
  }

  void onStartButtonTap() {
    _navigationUtil.navigateBack();
    _navigationUtil.navigateTo(AppRoutes.routeLesson);
  }
}

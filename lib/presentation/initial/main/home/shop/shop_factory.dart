import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/data/services/rewards/rewards_service.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/bloc/shop_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopFactory {
  static Widget build() {
    return BlocProvider<ShopCubit>(
      create: (BuildContext context) => ShopCubit(
        rewardsService: BlocProvider.of<RewardsService>(context),
        navigationUtil: sl.get<INavigationUtil>(),
      )..init(),
      child: Builder(
        builder: (context) {
          return ShopScreen(
            cubit: BlocProvider.of<ShopCubit>(context),
          );
        },
      ),
    );
  }
}

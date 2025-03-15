import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/domain/handlers/images/iselect_image_handler.dart';
import 'package:dsa_learning/domain/storage/ilocal_storage.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/profile/bloc/profile_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileFactory {
  static Widget build() {
    return BlocProvider<ProfileCubit>(
      create: (BuildContext context) => ProfileCubit(
        localStorage: sl.get<ILocalStorage>(),
        selectImageHandler: sl.get<ISelectImageHandler>(),
        navigationUtil: sl.get<INavigationUtil>(),
        userService: BlocProvider.of<UserService>(context),
      )..init(),
      child: Builder(
        builder: (BuildContext context) {
          return ProfileScreen(
            cubit: BlocProvider.of<ProfileCubit>(context),
          );
        },
      ),
    );
  }
}

import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/lesson_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonFactory {
  static Widget build() {
    return BlocProvider(
      create: (BuildContext context) => LessonCubit(),
      child: Builder(
        builder: (BuildContext context) {
          return LessonScreen(
            cubit: BlocProvider.of<LessonCubit>(context),
          );
        },
      ),
    );
  }
}

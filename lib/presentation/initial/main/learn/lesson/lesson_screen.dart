import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_cubit.dart';
import 'package:flutter/material.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({
    required this.cubit,
    super.key,
  });

  final LessonCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('lessonScreen'),
        ],
      ),
    );
  }
}

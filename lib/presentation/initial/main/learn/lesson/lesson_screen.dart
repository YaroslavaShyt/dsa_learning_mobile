import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/theory_widget.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
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
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            const MainBackground(),
            TheoryWidget(),
          ],
        ),
      ),
    );
  }
}

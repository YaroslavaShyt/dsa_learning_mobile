import 'package:dsa_learning/core/widgets/popup/popup_mixin.dart';
import 'package:dsa_learning/presentation/initial/loader/loader_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_state.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/confirm_exit_popup.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/theory_widget.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonScreen extends StatelessWidget with PopUpMixin {
  const LessonScreen({
    required this.cubit,
    super.key,
  });

  final LessonCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      builder: (BuildContext context, LessonState state) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                const MainBackground(),
                if (state.status == LessonStatus.loading) LoaderFactory.build(),
                if (state.status == LessonStatus.failure) const Text("oops"),
                if (state.status == LessonStatus.loaded)
                  TheoryWidget(
                    progress: state.progress,
                    lessonName: state.lessonTheory!.lessonTitle,
                    stepName: cubit.planStep,
                    content: cubit.theoryStep,
                    onNextButtonTap: () => cubit.onNextButtonPressed(
                      () => _onTheoryFinished(context),
                    ),
                    onBackButtonTap: () => cubit.onBackButtonPressed(
                      () => _confirmExit(context),
                    ),
                    onPauseButtonTap: cubit.onPauseButtonTap,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _confirmExit(BuildContext context) {
    showPopup(
      context: context,
      child: ConfirmExitPopup(
        onConfirmTap: cubit.onConfirmTap,
        onCancelTap: cubit.onCancelTap,
      ),
    );
  }

  void _onTheoryFinished(BuildContext context) {
    showPopup(
      context: context,
      child: ConfirmExitPopup(
        onConfirmTap: cubit.onConfirmTap,
        onCancelTap: cubit.onCancelTap,
      ),
    );
  }
}

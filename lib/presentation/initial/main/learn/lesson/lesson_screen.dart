import 'package:dsa_learning/core/widgets/popup/popup_mixin.dart';
import 'package:dsa_learning/presentation/initial/loader/loader_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_state.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/confirm_exit_popup.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/game_widget.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/theory_finished_popup.dart';
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
                if (state.status == LessonStatus.loaded) ...[
                  if (state.activityType == ActivityType.theory)
                    TheoryWidget(
                      lessonTime: state.theoryTime,
                      onUpdateTimer: cubit.onUpdateTimer,
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
                    ),
                  if (state.activityType == ActivityType.game)
                    GameWidget(
                      onAnswerSelected: () {},
                      questionsNum: state.game!.tasks.length,
                      task: cubit.task,
                      lessonTime: state.gameTime,
                      onUpdateTimer: cubit.onUpdateGameTimer,
                      progress: state.progress,
                      gameName: state.game!.title,
                      onNextButtonTap: () => cubit.onNextButtonPressed(
                        () => _onTheoryFinished(context),
                      ),
                      onBackButtonTap: () => cubit.onBackButtonPressed(
                        () => _confirmExit(context),
                      ),
                    ),
                ],
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
      height: 270,
      context: context,
      child: TheoryFinishedPopup(
        onConfirmTap: cubit.onLetsGoTap,
        onCancelTap: cubit.onLaterTap,
      ),
    );
  }
}

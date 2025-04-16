import 'package:dsa_learning/presentation/initial/loader/loader_factory.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/shop_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_state.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/confirm_exit_popup.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/all_vents_used_popup_content.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/game_widget.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/finish_on_theory_popup.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/theory_finished_popup.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/theory_widget.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:dsa_learning/presentation/widgets/placeholders/error/error_factory.dart';
import 'package:dsa_learning/presentation/widgets/popup/popup_mixin.dart';
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
              fit: StackFit.loose,
              children: [
                const MainBackground(),
                if (state.status == LessonStatus.loading) LoaderFactory.build(),
                if (state.status == LessonStatus.failure)
                  ErrorFactory.build(cubit.init),
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
                        (bytes, hash, vents) => _onTheoryFinished(
                          context,
                          bytes: bytes,
                          hash: hash,
                          vents: vents,
                        ),
                      ),
                      onBackButtonTap: () => cubit.onBackButtonPressed(
                        () => _confirmExit(context),
                      ),
                    ),
                  if (state.activityType == ActivityType.game)
                    GameWidget(
                      vents: state.vents,
                      gameProgress: state.gameProgress,
                      onAnswerSelected: (answer, isCorrect) =>
                          cubit.onAnswerSelected(
                        answer,
                        isCorrect,
                        () => _onAllVentsUsed(context),
                      ),
                      questionsNum: state.game!.tasks.length,
                      task: cubit.task,
                      lessonTime: state.gameTime,
                      onUpdateTimer: cubit.onUpdateGameTimer,
                      progress: state.progress,
                      gameName: state.game!.title,
                      selectedAnswer: state.selectedAnswer,
                      onNextButtonTap: () => cubit.onNextGameButtonPressed(
                        () => _onAllVentsUsed(context),
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

  void _onTheoryFinished(
    BuildContext context, {
    required int bytes,
    required int hash,
    required int vents,
  }) {
    showPopup(
      height: 270,
      context: context,
      child: TheoryFinishedPopup(
        bytes: bytes,
        hash: hash,
        vents: vents,
        onConfirmTap: cubit.onLetsGoTap,
        onCancelTap: () {
          cubit.onLaterTap();
          _onFinishOnTheory(context);
        },
      ),
    );
  }

  void _onFinishOnTheory(BuildContext context) {
    showPopup(
      height: 270,
      context: context,
      child: FinishOnTheoryPopup(
        isLessonLearned: cubit.isLessonLearned,
        onConfirmTap: () {
          cubit.onLaterTap();
          cubit.onLaterTap();
        },
        onCancelTap: cubit.onLetsGoTap,
      ),
    );
  }

  void _onAllVentsUsed(BuildContext context) {
    showPopup(
      height: 240,
      context: context,
      child: AllVentsUsedPopupContent(
        onConfirmTap: () {
          cubit.onLaterTap();
          _showShop(context);
        },
        onCancelTap: cubit.onVentsUsedNoTap,
      ),
    );
  }

  void _showShop(BuildContext context) {
    showPopup(
      height: 450,
      context: context,
      child: ShopFactory.build(),
    );
  }
}

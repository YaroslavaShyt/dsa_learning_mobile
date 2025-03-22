import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/buttons.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/progress_bar.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/step_name.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/theory_content.dart';
import 'package:flutter/material.dart';

class TheoryWidget extends StatelessWidget {
  const TheoryWidget({
    required this.lessonName,
    required this.stepName,
    required this.content,
    required this.onNextButtonTap,
    required this.onBackButtonTap,
    required this.onPauseButtonTap,
    super.key,
  });

  final String lessonName;
  final String stepName;
  final String content;
  final VoidCallback onPauseButtonTap;
  final VoidCallback onNextButtonTap;
  final VoidCallback onBackButtonTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 10.0,
        horizontal: 16,
      ),
      child: Column(
        spacing: 20,
        children: [
          ProgressBar(lessonName: lessonName),
          StepName(stepName: stepName),
          Expanded(
            child: TheoryContent(content: content),
          ),
          Buttons(
            onNextButtonTap: onNextButtonTap,
            onBackButtonTap: onBackButtonTap,
            onPauseButtonTap: onPauseButtonTap,
          ),
        ],
      ),
    );
  }
}

const String contentT =
    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.\n\nLorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.';

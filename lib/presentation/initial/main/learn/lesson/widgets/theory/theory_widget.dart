import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/buttons.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/progress_bar.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/step_name.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/theory_content.dart';
import 'package:flutter/material.dart';

class TheoryWidget extends StatefulWidget {
  const TheoryWidget({
    required this.progress,
    required this.lessonName,
    required this.stepName,
    required this.content,
    required this.onNextButtonTap,
    required this.onBackButtonTap,
    required this.lessonTime,
    required this.onUpdateTimer,
    required this.image,
    super.key,
  });

  final int lessonTime;
  final double progress;
  final String lessonName;
  final String stepName;
  final String content;
  final String image;
  final VoidCallback onNextButtonTap;
  final VoidCallback onBackButtonTap;
  final VoidCallback onUpdateTimer;

  @override
  State<TheoryWidget> createState() => _TheoryWidgetState();
}

class _TheoryWidgetState extends State<TheoryWidget> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      child: Column(
        spacing: 20,
        children: [
          ProgressBar(
            time: widget.lessonTime,
            updateTimer: widget.onUpdateTimer,
            lessonName: widget.lessonName,
            value: widget.progress,
          ),
          StepName(stepName: widget.stepName),
          Expanded(
            child: TheoryContent(
              controller: _controller,
              image: widget.image,
              content: widget.content,
            ),
          ),
          Buttons(
            isAnswerSelected: true,
            onNextButtonTap: () {
              widget.onNextButtonTap.call();
              _controller.jumpTo(0);
            },
            onBackButtonTap: () {
              widget.onBackButtonTap.call();
              _controller.jumpTo(0);
            },
          ),
        ],
      ),
    );
  }
}

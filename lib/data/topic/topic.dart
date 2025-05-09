import 'package:dsa_learning/domain/lesson/ilesson.dart';
import 'package:dsa_learning/domain/topic/itopic.dart';

class Topic implements ITopic {
  Topic({
    required this.title,
    required this.lessons,
    required this.id,
  });

  @override
  final int id;

  @override
  final String title;

  @override
  final List<ILesson> lessons;
}

import 'package:dsa_learning/domain/lesson/ilesson.dart';

abstract interface class ITopic {
  ITopic({
    required this.id,
    required this.title,
    required this.lessons,
  });

  final int id;
  final String title;
  final List<ILesson> lessons;
}

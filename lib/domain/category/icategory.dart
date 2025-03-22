import 'package:dsa_learning/domain/topic/itopic.dart';

abstract interface class ICategory {
  ICategory({
    required this.title,
    required this.topics,
  });

  final String title;
  final List<ITopic> topics;
}

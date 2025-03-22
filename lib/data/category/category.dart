import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:dsa_learning/domain/topic/itopic.dart';

class Category implements ICategory {
  Category({
    required this.title,
    required this.topics,
  });

  @override
  final String title;

  @override
  final List<ITopic> topics;
}

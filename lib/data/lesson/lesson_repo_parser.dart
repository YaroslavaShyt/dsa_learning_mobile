part of 'lesson_repository.dart';

ITopic _createTopic(String topic, List lessonData) {
  return Topic(
    id: lessonData.first["topicId"],
    title: topic,
    lessons: _createLessons(lessonData),
  );
}

List<ILesson> _createLessons(List lessonData) {
  return lessonData.map(
    (lesson) {
      return Lesson.fromJson(lesson);
    },
  ).toList();
}

ICategory _createCategory(String category, Map categoryData) {
  return Category(
    title: category,
    topics: _createTopics(categoryData),
  );
}

List<ITopic> _createTopics(Map categoryData) {
  return categoryData.keys.map(
    (topic) {
      return _createTopic(topic, categoryData[topic]);
    },
  ).toList();
}

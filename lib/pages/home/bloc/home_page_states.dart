import 'package:ulearning_app/common/entities/course.dart';

class HomePageStates {
  final int index;
  final List<CourseItem> courseItems;
  const HomePageStates({
    this.index = 0,
    this.courseItems = const <CourseItem>[],
  });

  HomePageStates copyWith({int? index, List<CourseItem>? courseItems}) {
    return HomePageStates(
      index: index ?? this.index,
      courseItems: courseItems ?? this.courseItems,
    );
  }
}

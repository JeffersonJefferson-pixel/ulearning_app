import 'package:ulearning_app/common/entities/course.dart';

abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  final int index;
  HomePageDots(this.index);
}

class HomePageCourseItem extends HomePageEvents {
  final List<CourseItem> courseItems;
  HomePageCourseItem(this.courseItems);
}

import 'package:ulearning_app/common/entities/course.dart';

abstract class CourseDetailEvents {
  const CourseDetailEvents();
}

class TriggerCourseDetail extends CourseDetailEvents {
  final CourseItem courseItem;
  const TriggerCourseDetail(this.courseItem) : super();
}

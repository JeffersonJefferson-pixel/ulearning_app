import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');
    print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/courseDetail', queryParameters: params?.toJson());

    return CourseDetailResponseEntity.fromJson(response);
  }
}

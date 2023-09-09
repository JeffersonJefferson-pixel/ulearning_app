import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning_app/common/apis/course_api.dart';
import 'package:ulearning_app/common/entities/course.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/course/bloc/course_detail_blocs.dart';
import 'package:ulearning_app/pages/course/bloc/course_detail_events.dart';

class CourseDetailController {
  final BuildContext context;
  CourseDetailController({required this.context});

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadAllData(args["id"]);
  }

  asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    CourseDetailResponseEntity result =
        await CourseAPI.courseDetail(params: courseRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context
            .read<CourseDetailBlocs>()
            .add(TriggerCourseDetail(result.data!));
      }
    } else {
      toastInfo(msg: "Something went wrong");
      print('Error code: ${result.code}');
    }
  }

  void goBuy(int? id) async {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if (result.code == 200) {
      var url = Uri.decodeFull(result.data!);
      print('url: $url');
    } else {
      print('payment failed');
    }
  }
}

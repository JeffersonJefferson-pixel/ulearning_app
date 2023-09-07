import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/apis/course_api.dart';
import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_events.dart';

class HomeController {
  late BuildContext context;
  static final HomeController _singleton = HomeController._internal();

  HomeController._internal();

  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  UserItem? get userProfile => Global.storageService.getUserProfile();

  Future<void> init() async {
    print('here');
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courseList();
      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }
      } else {
        print(result.code);
      }
    } else {
      print("User has already logged out");
    }
  }
}

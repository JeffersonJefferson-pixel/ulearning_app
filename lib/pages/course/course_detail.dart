import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/base_text_widget.dart';
import 'package:ulearning_app/pages/course/bloc/course_detail_blocs.dart';
import 'package:ulearning_app/pages/course/bloc/course_detail_states.dart';
import 'package:ulearning_app/pages/course/course_detail_controller.dart';
import 'package:ulearning_app/pages/course/widgets/course_detail_widgets.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late CourseDetailController _courseDetailController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBlocs, CourseDetailStates>(
        builder: (context, state) {
      return state.courseItem == null
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            )
          : Container(
              color: AppColors.primaryBackground,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: AppColors.primaryBackground,
                  appBar: buildAppBar(),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 25.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                thumbnail(
                                    state.courseItem!.thumbnail.toString()),
                                SizedBox(
                                  height: 15.h,
                                ),
                                menuView(),
                                SizedBox(
                                  height: 15.h,
                                ),
                                reusableText("Course Description"),
                                SizedBox(
                                  height: 15.h,
                                ),
                                descriptionText(state.courseItem?.description),
                                SizedBox(
                                  height: 20.h,
                                ),
                                buyButton("Go Buy"),
                                SizedBox(
                                  height: 20.h,
                                ),
                                courseSummaryTitle(),
                                courseSummaryView(context, state),
                                SizedBox(
                                  height: 20.h,
                                ),
                                lessonListTitle(),
                                SizedBox(
                                  height: 20.h,
                                ),
                                courseLessonList(),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}

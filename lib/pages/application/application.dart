import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/application/widgets/application_widgets.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1)
                ]),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourthElementText,
              type: BottomNavigationBarType.fixed,
              currentIndex: _index,
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/icons/home.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                  label: "home",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/home.png"),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/icons/search2.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                  label: "search",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/search2.png"),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/icons/play-circle1.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                  label: "course",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/play-circle1.png"),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/icons/message-circle.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                  label: "chat",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/message-circle.png"),
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      "assets/icons/person2.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                  label: "profile",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/person2.png"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

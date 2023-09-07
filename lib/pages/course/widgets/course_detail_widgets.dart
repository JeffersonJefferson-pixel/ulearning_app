import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    title: reusableText("Course Detail"),
  );
}

Widget thumbnail() {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: AssetImage("assets/icons/image_1.png"),
      ),
    ),
  );
}

Widget menuView() {
  return SizedBox(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(7.w),
              border: Border.all(color: AppColors.primaryElement),
            ),
            child: reusableText(
              "Author Page",
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal,
              fontSize: 10.sp,
            ),
          ),
        ),
        _iconAndNum('assets/icons/people.png', 0),
        _iconAndNum('assets/icons/star.png', 0)
      ],
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(children: [
      Image(
        image: AssetImage(iconPath),
        width: 20.w,
        height: 20.h,
      ),
      reusableText(
        num.toString(),
        color: AppColors.primaryThirdElementText,
        fontSize: 11.sp,
        fontWeight: FontWeight.normal,
      )
    ]),
  );
}

Widget descriptionText() {
  return reusableText(
    "Sit dolor et ipsum exercitation aliqua. Est cupidatat labore excepteur dolore officia anim deserunt. Non voluptate in dolore duis reprehenderit qui laborum deserunt ut veniam. Commodo cillum esse exercitation ipsum dolor velit dolor minim cillum deserunt aute occaecat id.",
    color: AppColors.primaryThirdElementText,
    fontWeight: FontWeight.normal,
    fontSize: 11.sp,
  );
}

Widget buyButton(String name) {
  return Container(
    padding: EdgeInsets.only(top: 13.h),
    width: 330.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(color: AppColors.primaryElement),
    ),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryElementText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

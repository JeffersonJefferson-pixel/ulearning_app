import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_states.dart';
import 'package:ulearning_app/pages/home/home_controller.dart';
import 'package:ulearning_app/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserItem? userProfile;
  @override
  void initState() {
    super.initState();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return userProfile != null
        ? BlocBuilder<HomePageBlocs, HomePageStates>(builder: (context, state) {
            if (state.courseItems.isEmpty) {
              HomeController(context: context).init();
            } else {
              print("course items is not empty");
            }
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(userProfile!.avatar.toString()),
              body: Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: homePageText(
                        "Hello",
                        color: AppColors.primaryThirdElementText,
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: homePageText(
                      userProfile!.name.toString(),
                      top: 5,
                    )),
                    SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                    SliverToBoxAdapter(child: searchView()),
                    SliverToBoxAdapter(child: slidersView(context, state)),
                    SliverToBoxAdapter(child: menuView()),
                    SliverPadding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1.6,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.courseItems.length,
                          (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppRoutes.COURSE_DETAIL,
                                      arguments: {
                                        "id": state.courseItems[index].id
                                      });
                                },
                                child: courseGrid(state.courseItems[index]));
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          })
        : Container();
  }
}

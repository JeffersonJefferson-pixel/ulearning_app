import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  late HomeController _homeController;
  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return _homeController.userProfile != null
        ? BlocBuilder<HomePageBlocs, HomePageStates>(builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar:
                  buildAppBar(_homeController.userProfile!.avatar.toString()),
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
                      _homeController.userProfile!.name.toString(),
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
                          childCount: 4,
                          (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {}, child: courseGrid());
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

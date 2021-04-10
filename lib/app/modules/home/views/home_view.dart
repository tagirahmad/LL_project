import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../widgets/main_content.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text('Курс на достаток и свободу',
                    style: Theme.of(context).textTheme.headline6),
                pinned: false,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                backgroundColor: AppColors.BACKGROUND_COLOR,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    semanticsLabel: 'App Logo',
                    height: Dimensions.LOGO_SIZE,
                    width: Dimensions.LOGO_SIZE,
                    // color: AppColors.LOGO_INNER_COLOR,
                    // colorBlendMode: BlendMode.color,
                    // cacheColorFilter: true,
                  ),
                ),
                toolbarHeight: 80.0,
              )
            ];
          },
          body: const SafeArea(
            child: SingleChildScrollView(
              child: MainContent(),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';

class WorkArticleView extends GetView {
  const WorkArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                Get.arguments.title as String,
                style: Theme.of(context).textTheme.headline6!,
              ),
              leading: const BackButton(color: Colors.black),
              pinned: false,
              floating: true,
              snap: true,
              backgroundColor: AppColors.BACKGROUND_COLOR,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.SIDE_INDENT),
            child: Text(
              Get.arguments.text as String,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      ),
    );
  }
}

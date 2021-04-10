import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class SplashView extends StatefulWidget {
  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView>
    with AfterLayoutMixin<SplashView> {
  Future checkFirstSeen() async {
    var prefs = await SharedPreferences.getInstance();
    var _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Get.toNamed(Routes.HOME);
    } else {
      // await prefs.setBool('seen', true);
      Get.toNamed(Routes.INTRO);
      // Navigator.of(context).pushReplacement(
      //     new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/app_controller.dart';

class AppView extends GetView<AppController> {
  const AppView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AppView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

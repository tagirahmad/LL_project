import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/work_controller.dart';

class WorkView extends GetView<WorkController> {
  const WorkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WorkView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

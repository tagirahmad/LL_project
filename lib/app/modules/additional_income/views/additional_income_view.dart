import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/additional_income_controller.dart';

class AdditionalIncomeView extends GetView<AdditionalIncomeController> {
  const AdditionalIncomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdditionalIncomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdditionalIncomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

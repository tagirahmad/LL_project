import 'package:get/get.dart';

import '../controllers/additional_income_controller.dart';

class AdditionalIncomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdditionalIncomeController>(
      () => AdditionalIncomeController(),
    );
  }
}

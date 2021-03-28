import 'package:get/get.dart';

import '../controllers/finance_controller.dart';

class FinaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinanceController>(
      () => FinanceController(),
    );
  }
}

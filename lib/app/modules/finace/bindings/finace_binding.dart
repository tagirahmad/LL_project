import 'package:get/get.dart';

import '../controllers/finace_controller.dart';

class FinaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinaceController>(
      () => FinaceController(),
    );
  }
}

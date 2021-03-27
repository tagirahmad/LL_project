import 'package:get/get.dart';

import '../controllers/work_controller.dart';

class WorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkController>(
      () => WorkController(),
    );
  }
}

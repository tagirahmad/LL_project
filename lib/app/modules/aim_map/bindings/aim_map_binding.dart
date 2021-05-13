import 'package:get/get.dart';

import '../controllers/aim_map_controller.dart';

class AimMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AimMapController>(
      () => AimMapController(),
    );
  }
}

import 'package:get/get.dart';

import 'package:l_l_app/app/modules/questionnaire/controllers/profile_controller.dart';

import '../controllers/questionnaire_controller.dart';

class QuestionnaireBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<QuestionnaireController>(
      () => QuestionnaireController(),
    );
  }
}

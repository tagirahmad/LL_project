import 'package:get/get.dart';
import 'package:l_l_app/app/modules/finace/model/finance.dart';

class FinaceController extends GetxController {
  static FinaceController get to => Get.find();

  final Rx<Finance> finance = Finance().obs;
}

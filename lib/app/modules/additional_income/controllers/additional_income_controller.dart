import 'package:get/get.dart';

class AdditionalIncomeController extends GetxController {
  final RxInt count = 0.obs;



  @override
  void onClose() {}

  void increment() => count.value++;
}

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:l_l_app/app/modules/questionnaire/models/profile.dart';
import 'package:l_l_app/app/services/hive_service.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  final ImagePicker picker = ImagePicker();
  final Rx<Profile> userProfile = Profile().obs;
  final HiveService hiveService = HiveService();

  Future<void> pickImage() async {
    // ignore: omit_local_variable_types
    final PickedFile? pickedFile =
        await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      userProfile.value!.profileImagePath = pickedFile.path;
      await hiveService.putImagePath(pickedFile.path, userProfile);
      await hiveService.profile.put('image', pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  @override
  void onInit() {
    hiveService.getImageFromStore(userProfile);
    hiveService.getNameFromStore(userProfile);
    hiveService.getAgeFromStore(userProfile);
    hiveService.getCityFromStore(userProfile);
    hiveService.getYearAimsFromStore(userProfile);
    hiveService.getLifeAimsFromStore(userProfile);
    hiveService.getAimActionsFromStore(userProfile);
    // hiveService.profile.clear();
    // hiveService.yearAims.clear();
    // hiveService.lifeAims.clear();
    super.onInit();
  }

  @override
  void onClose() {
    hiveService.textEditingController.dispose();
    super.onClose();
  }
}

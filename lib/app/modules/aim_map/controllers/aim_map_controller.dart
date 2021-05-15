import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';

import '../../../services/hive_aim_map_service.dart';
import '../../../services/subscription_status.dart';
import '../models/aim_map.dart';

class AimMapController extends GetxController {
  late ScreenshotController screenshotController;
  final Rx<GlobalKey> imageKey = GlobalKey().obs;
  late ImagePicker picker;
  final HiveAimMapService hiveAimMapService = HiveAimMapService();

  final Rx<AimMap> aimMap = AimMap().obs;

  final Rx<File> moneyImg = File('').obs;
  final Rx<File> loveImg = File('').obs;
  final Rx<File> homeImg = File('').obs;
  final Rx<File> kidsImg = File('').obs;
  final Rx<File> knowledgeImg = File('').obs;
  final Rx<File> helpersImg = File('').obs;
  final Rx<File> notorietyImg = File('').obs;
  final Rx<File> yourImg = File('').obs;
  final Rx<File> careerImg = File('').obs;

  void pickImg(Rx<File> img, AimMapImg type) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      changeAimMap(File(pickedFile.path), type);
    }
  }

  void changeAimMap(File value, AimMapImg type) {
    var aimMap = this.aimMap.value!;

    switch (type) {
      case AimMapImg.moneyImg:
        aimMap.moneyImg = value.path;
        break;
      case AimMapImg.careerImg:
        aimMap.careerImg = value.path;
        break;
      case AimMapImg.helpersImg:
        aimMap.helpersImg = value.path;
        break;
      case AimMapImg.homeImg:
        aimMap.homeImg = value.path;
        break;
      case AimMapImg.kidsImg:
        aimMap.kidsImg = value.path;
        break;
      case AimMapImg.knowledgeImg:
        aimMap.knowledgeImg = value.path;
        break;
      case AimMapImg.loveImg:
        aimMap.loveImg = value.path;
        break;
      case AimMapImg.notorietyImg:
        aimMap.notorietyImg = value.path;
        break;
      case AimMapImg.yourImg:
        aimMap.yourImg = value.path;
        break;
      default:
    }

    var isPurchased = isPro.isPro;
    if (!isPurchased) {
      this.aimMap.value = AimMap(
        careerImg: aimMap.careerImg,
        moneyImg: aimMap.moneyImg,
        loveImg: aimMap.loveImg,
        yourImg: aimMap.yourImg,
        helpersImg: aimMap.helpersImg,
        homeImg: aimMap.homeImg,
        kidsImg: aimMap.kidsImg,
        knowledgeImg: aimMap.knowledgeImg,
        notorietyImg: aimMap.notorietyImg,
      );
    }

    setToAimMap(hiveAimMapService, aimMap);
  }

  AimMap getAimMap() {
    var isPurchased = isPro.isPro;
    // var isPurchased = true;
    if (isPurchased) {
      var fromStore = hiveAimMapService.getAimMapFromStore();
      aimMap.value = fromStore;
      return fromStore;
    } else {
      hiveAimMapService.aimMapBox.clear();
      return AimMap();
    }
  }

  void setToAimMap(HiveAimMapService hiveAimMapService, AimMap aimMap) {
    var isPurchased = isPro.isPro;
    // var isPurchased = true;
    if (isPurchased) {
      hiveAimMapService.putAimMap(aimMap);
      // this.aimMap.value = aimMap;
      this.aimMap.value = aimMap.copyWith(
        careerImg: aimMap.careerImg,
        moneyImg: aimMap.moneyImg,
        loveImg: aimMap.loveImg,
        yourImg: aimMap.yourImg,
        helpersImg: aimMap.helpersImg,
        homeImg: aimMap.homeImg,
        kidsImg: aimMap.kidsImg,
        knowledgeImg: aimMap.knowledgeImg,
        notorietyImg: aimMap.notorietyImg,
      );
      print('successfully saved because user is pro');
    } else {
      hiveAimMapService.aimMapBox.clear();
      this.aimMap.value = aimMap;
      print('is not saved because user is not pro');
    }
  }

  @override
  void onInit() {
    getAimMap();
    screenshotController = ScreenshotController();
    picker = ImagePicker();
    super.onInit();
  }
}

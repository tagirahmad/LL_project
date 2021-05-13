import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';

class AimMapController extends GetxController {
  late ScreenshotController screenshotController;
  final Rx<GlobalKey> imageKey = GlobalKey().obs;
  late ImagePicker picker;

  final Rx<File> moneyImg = File('').obs;
  final Rx<File> loveImg = File('').obs;
  final Rx<File> homeImg = File('').obs;
  final Rx<File> kidsImg = File('').obs;
  final Rx<File> knowledgeImg = File('').obs;
  final Rx<File> helpersImg = File('').obs;
  final Rx<File> notorietyImg = File('').obs;
  final Rx<File> yourImg = File('').obs;
  final Rx<File> careerImg = File('').obs;

  @override
  void onInit() {
    super.onInit();
    screenshotController = ScreenshotController();
    picker = ImagePicker();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

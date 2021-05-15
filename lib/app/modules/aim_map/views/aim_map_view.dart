import 'dart:io';

import 'package:davinci/core/davinci_core.dart';
import 'package:davinci/davinci.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l_l_app/app/services/subscription_status.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../controllers/aim_map_controller.dart';
import '../models/aim_map.dart';

class AimMapView extends GetView<AimMapController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                'Карта целей',
                style: Theme.of(context).textTheme.headline6!,
              ),
              leading: const BackButton(color: Colors.black),
              pinned: false,
              floating: true,
              snap: true,
              backgroundColor: AppColors.BACKGROUND_COLOR,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: SaveAimMapButton(
                  controller: controller,
                  onPressed: () => saveAimMap(context, controller),
                ),
              ),
              Davinci(builder: (key) {
                controller.imageKey.value = key;
                return Container(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => AimMapItem(
                                  imageFile: File(
                                      controller.aimMap.value!.moneyImg ?? ''),
                                  alignment: Alignment.centerLeft,
                                  color: Color(0xFFE8E8A0),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 200,
                                  title: 'Деньги,\nбогатство,\nпроцветание\n',
                                  onTap: () => controller.pickImg(
                                      controller.moneyImg, AimMapImg.moneyImg),
                                ),
                              ),
                              Obx(
                                () => AimMapItem(
                                  imageFile: File(
                                      controller.aimMap.value!.loveImg ?? ''),
                                  alignment: Alignment.centerRight,
                                  color: Color(0xFFF3ABD1),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 200,
                                  title: 'Любовь,\nбрак,\nотношения\n',
                                  onTap: () => controller.pickImg(
                                      controller.loveImg, AimMapImg.loveImg),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => AimMapItem(
                                  imageFile: File(
                                      controller.aimMap.value!.homeImg ?? ''),
                                  alignment: Alignment.centerLeft,
                                  color: Color(0xFF83DDCE),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 180,
                                  title: 'Дом,\nсемья,\nродственники\n',
                                  onTap: () => controller.pickImg(
                                      controller.homeImg, AimMapImg.homeImg),
                                ),
                              ),
                              Obx(
                                () => AimMapItem(
                                  imageFile: File(
                                      controller.aimMap.value!.kidsImg ?? ''),
                                  alignment: Alignment.centerRight,
                                  color: Color(0xFFF4B190),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 180,
                                  title: 'Дети,\nпроекты,\nтворчество\n',
                                  onTap: () => controller.pickImg(
                                      controller.kidsImg, AimMapImg.kidsImg),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => AimMapItem(
                                  imageFile: File(
                                      controller.aimMap.value!.knowledgeImg ??
                                          ''),
                                  color: Color(0xFFBD95D1),
                                  alignment: Alignment.centerLeft,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 200,
                                  title: 'Знание,\nобразование,\nмудрость\n',
                                  onTap: () => controller.pickImg(
                                      controller.knowledgeImg,
                                      AimMapImg.knowledgeImg),
                                ),
                              ),
                              Obx(
                                () => AimMapItem(
                                  imageFile: File(
                                      controller.aimMap.value!.helpersImg ??
                                          ''),
                                  alignment: Alignment.centerRight,
                                  color: Color(0xFF55C8DF),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 200,
                                  title:
                                      'Помощники,\nпутешествия,\nнаставники\n',
                                  onTap: () => controller.pickImg(
                                      controller.helpersImg,
                                      AimMapImg.helpersImg),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => AimMapItem(
                                  imageFile: File(
                                      controller.aimMap.value!.notorietyImg ??
                                          ''),
                                  alignment: Alignment.center,
                                  color: Color(0xFFF5A6B2),
                                  height: 130,
                                  width: 160,
                                  title:
                                      // ignore: lines_longer_than_80_chars
                                      'Известность,\nдостижения,\nсамореализация\n',
                                  onTap: () => controller.pickImg(
                                      controller.notorietyImg,
                                      AimMapImg.notorietyImg),
                                ),
                              ),
                              Obx(
                                () => YourPhoto(
                                  imageFile: File(
                                      controller.aimMap.value!.yourImg ?? ''),
                                  width: 130.0,
                                  height: 130.0,
                                  onTap: () => controller.pickImg(
                                      controller.yourImg, AimMapImg.yourImg),
                                ),
                              ),
                              Obx(
                                () => AimMapItem(
                                  imageFile: File(
                                      controller.aimMap.value!.careerImg ?? ''),
                                  alignment: Alignment.center,
                                  color: Color(0xFFC366F2),
                                  height: 130,
                                  width: 160,
                                  title: 'Карьера,\nпрофессия,\nбизнес\n',
                                  onTap: () => controller.pickImg(
                                      controller.careerImg,
                                      AimMapImg.careerImg),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> saveAimMap(
    BuildContext context, AimMapController controller) async {
  var isPurchased = isPro.isPro;
  if (isPurchased) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    await DavinciCapture.click(
      controller.imageKey.value!,
      fileName: "Карта целей",
      pixelRatio: pixelRatio,
    );
  } else {
    Get.snackbar(
      "Внимание!",
      "Чтобы сохранить, приобретите подписку",
      snackPosition: SnackPosition.TOP,
    );
  }
}

class SaveAimMapButton extends StatelessWidget {
  const SaveAimMapButton({
    Key? key,
    required this.controller,
    this.onPressed,
  }) : super(key: key);

  final AimMapController controller;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.save_alt),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      label: Center(
          child: Text(
        'Сохранить карту целей',
      )),
    );
  }
}

class YourPhoto extends StatelessWidget {
  const YourPhoto({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.imageFile,
  }) : super(key: key);

  final double width;
  final double height;
  final VoidCallback onTap;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFD8958D),
        ),
        child: imageFile != null && imageFile?.path != ''
            ? ClipOval(
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ),
              )
            : Center(
                child: Text(
                  'Твое фото',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}

class AimMapItem extends StatelessWidget {
  AimMapItem({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.title,
    required this.alignment,
    this.onTap,
    this.imageFile,
  }) : super(key: key);

  final AlignmentGeometry alignment;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final Color color;
  final String title;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        color: color,
        padding: imageFile == null || imageFile?.path == ''
            ? const EdgeInsets.all(Dimensions.SIDE_INDENT)
            : null,
        child: imageFile != null && imageFile?.path != ''
            ? Image.file(imageFile!, fit: BoxFit.fill)
            : Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: alignment,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Добавить фото',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

import 'dart:io';

import 'package:davinci/core/davinci_core.dart';
import 'package:davinci/davinci.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../controllers/aim_map_controller.dart';

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
                child: SaveAimMapButton(controller: controller),
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
                                  imageFile: controller.moneyImg.value,
                                  alignment: Alignment.centerLeft,
                                  color: Colors.red,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 200,
                                  title: 'Деньги,\nбогатство,\nпроцветание\n',
                                  onTap: () => _pickImg(controller.moneyImg),
                                ),
                              ),
                              Obx(
                                () => AimMapItem(
                                  imageFile: controller.loveImg.value,
                                  alignment: Alignment.centerRight,
                                  color: Colors.blue,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 200,
                                  title: 'Любовь,\nбрак,\nотношения\n',
                                  onTap: () => _pickImg(controller.loveImg),
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
                                  imageFile: controller.homeImg.value,
                                  alignment: Alignment.centerLeft,
                                  color: Colors.green,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 180,
                                  title: 'Дом,\nсемья,\nродственники\n',
                                  onTap: () => _pickImg(controller.homeImg),
                                ),
                              ),
                              Obx(
                                () => AimMapItem(
                                  imageFile: controller.kidsImg.value,
                                  alignment: Alignment.centerRight,
                                  color: Colors.yellow,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 180,
                                  title: 'Дети,\nпроекты,\nтворчество\n',
                                  onTap: () => _pickImg(controller.kidsImg),
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
                                  imageFile: controller.knowledgeImg.value,
                                  color: Colors.orange,
                                  alignment: Alignment.centerLeft,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 200,
                                  title: 'Знание,\nобразование,\nмудрость\n',
                                  onTap: () => _pickImg(controller.knowledgeImg),
                                ),
                              ),
                              Obx(
                                () => AimMapItem(
                                  imageFile: controller.helpersImg.value,
                                  alignment: Alignment.centerRight,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height: 200,
                                  title:
                                      'Помощники,\nпутешествия,\nнаставники\n',
                                  onTap: () => _pickImg(controller.helpersImg),
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
                                  imageFile: controller.notorietyImg.value,
                                  alignment: Alignment.center,
                                  color: Colors.blueGrey,
                                  height: 130,
                                  width: 160,
                                  title:
                                      // ignore: lines_longer_than_80_chars
                                      'Известность,\nдостижения,\nсамореализация\n',
                                  onTap: () => _pickImg(controller.notorietyImg),
                                ),
                              ),
                              YourPhoto(
                                width: 130.0,
                                height: 130.0,
                              ),
                              Obx(
                                () => AimMapItem(
                                  imageFile: controller.careerImg.value,
                                  alignment: Alignment.center,
                                  color: Colors.blueGrey,
                                  height: 130,
                                  width: 160,
                                  title: 'Карьера,\nпрофессия,\nбизнес\n',
                                  onTap: () => _pickImg(controller.careerImg),
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

  void _pickImg(Rx<File> img) async {
    final pickedFile =
        await controller.picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      img.value = File(pickedFile.path);
    }
  }
}

class SaveAimMapButton extends StatelessWidget {
  const SaveAimMapButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AimMapController controller;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        final pixelRatio = MediaQuery.of(context).devicePixelRatio;
        print("$pixelRatio pixel ratio");
        await DavinciCapture.click(
          controller.imageKey.value!,
          fileName: "Карта целей",
          pixelRatio: pixelRatio,
        );
      },
      icon: Icon(Icons.save),
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
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Center(
        child: Text(
          'Твое фото',
          style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
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
            ? FittedBox(fit: BoxFit.fill, child: Image.file(imageFile!))
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
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Добавить фото',
                            style: TextStyle(
                              fontSize: 10.0,
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

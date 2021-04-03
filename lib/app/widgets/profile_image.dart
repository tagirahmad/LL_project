import 'dart:io';

import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, required this.onTap, required this.imagePath})
      : super(key: key);

  final VoidCallback onTap;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.mirror,
              colors: <Color>[Colors.white, AppColors.BACKGROUND_COLOR]),
          border: Border.all(color: Colors.white, width: 1.0),
        ),
        child: CircleAvatar(
          radius: Dimensions.CIRCLE_RADIUS,
          backgroundColor: Colors.transparent,
          backgroundImage:
              imagePath == null ? null : FileImage(File(imagePath!)),
          foregroundColor: Colors.black,
          child: imagePath == null
              ? const Text(
                  'Твое любимое фото',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}

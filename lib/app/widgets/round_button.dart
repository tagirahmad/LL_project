import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:l_l_app/app/constants/dimensions.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      required this.onPressed,
      required this.iconPath,
      required this.color,
      this.hasBorder})
      : super(key: key);

  final Function() onPressed;
  final String iconPath;
  final Color color;
  final bool? hasBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(
              side: hasBorder != null && hasBorder == true
                  ? const BorderSide(width: 1.0, color: Colors.white)
                  : BorderSide.none),
          primary: color,
          padding: EdgeInsets.zero),
      onPressed: onPressed,
      child: SvgPicture.asset(
        iconPath,
        height: Dimensions.SMALL_ICON_SIZE,
        width: Dimensions.SMALL_ICON_SIZE,
        cacheColorFilter: true,
      ),
    );
  }
}

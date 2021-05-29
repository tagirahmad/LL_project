import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/dimensions.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({
    Key? key,
    required this.color,
    required this.onPress,
    required this.title,
    required this.iconPath,
  }) : super(key: key);

  final Color color;
  final Function() onPress;
  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS),
      child: InkWell(
        onTap: onPress,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .4,
              decoration: BoxDecoration(
                color: color.withOpacity(0.6),
                borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS),
              ),
              padding: const EdgeInsets.all(Dimensions.SIDE_INDENT),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: Dimensions.SIDE_INDENT),
                  SvgPicture.asset(
                    iconPath,
                    height: Dimensions.ICON_SIZE,
                    width: Dimensions.ICON_SIZE,
                    cacheColorFilter: true,
                    allowDrawingOutsideViewBox: true,
                  ),
                  const SizedBox(height: Dimensions.SIDE_INDENT),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

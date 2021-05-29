import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class MainContentItem extends StatelessWidget {
  const MainContentItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.mirror,
          colors: <Color>[
            Colors.white.withOpacity(0.19),
            Colors.white,
            Colors.white.withOpacity(0.4),
          ],
        ),
      ),
      child: Material(
        // color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS),
          ),
          splashColor: AppColors.BACKGROUND_COLOR,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.w400),
                  // textAlign: TextAlign.center,
                )),
                SvgPicture.asset(
                  icon,
                  height: Dimensions.ICON_SIZE,
                  width: Dimensions.ICON_SIZE,
                  cacheColorFilter: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

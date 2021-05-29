import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/dimensions.dart';
import 'round_button.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {Key? key,
      required this.color,
      required this.onPress,
      required this.title,
      this.showSubtitle})
      : super(key: key);

  final Color color;
  final Function() onPress;
  final String title;
  final String Function()? showSubtitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Column(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: Dimensions.SIDE_INDENT),
                  showSubtitle != null
                      ? Obx(() => Text(
                            '${showSubtitle!()} руб.',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white),
                          ))
                      : const SizedBox(),
                  const SizedBox(height: Dimensions.SIDE_INDENT),
                ],
              ),
            ),
            const SizedBox(height: 25)
          ],
        ),
        Positioned(
          bottom: 0,
          child: RoundButton(
            onPressed: onPress,
            hasBorder: true,
            iconPath: 'assets/images/dots.svg',
            color: color,
          ),
        )
      ],
    );
  }
}

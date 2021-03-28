import 'package:flutter/material.dart';
import 'package:l_l_app/app/constants/dimensions.dart';
import 'package:l_l_app/app/widgets/round_button.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {Key? key,
      required this.color,
      required this.onPress,
      required this.title})
      : super(key: key);

  final Color color;
  final Function() onPress;
  final String title;

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
                    borderRadius:
                        BorderRadius.circular(Dimensions.BORDER_RADIUS)),
                padding: const EdgeInsets.all(Dimensions.SIDE_INDENT),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: Dimensions.SIDE_INDENT),
                    Text(
                      '        .руб',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: Dimensions.SIDE_INDENT),
                  ],
                )),
            const SizedBox(height: 25)
          ],
        ),
        Positioned(
          // bottom: -25,
          bottom: 0,
          child: RoundButton(
              onPressed: onPress,
              hasBorder: true,
              iconPath: 'assets/images/dots.svg',
              color: color),
        )
      ],
    );
  }
}

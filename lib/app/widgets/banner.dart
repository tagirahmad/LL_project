import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({Key? key, required this.showLogo, required this.text})
      : super(key: key);

  final bool showLogo;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF5EB4F9),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (showLogo)
            SvgPicture.asset(
              'assets/images/logo.svg',
              semanticsLabel: 'App Logo',
              height: 60,
              width: 60,
              color: const Color(0xFFFFDE59),
              colorBlendMode: BlendMode.color,
            )
          else
            Container(),
          if (showLogo)
            const SizedBox(
              height: 10.0,
            )
          else
            Container(),
          Text(
            text.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

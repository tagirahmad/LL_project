import 'package:flutter/material.dart';

import '../constants/dimensions.dart';
import '../modules/questionnaire/controllers/profile_controller.dart';
import '../modules/questionnaire/models/aim.dart';
import '../modules/questionnaire/models/aim_action.dart';
import '../modules/questionnaire/models/questionnaire_type.dart';
import 'round_button.dart';

class QuestionnaireContainer extends StatelessWidget {
  const QuestionnaireContainer({
    Key? key,
    required this.items,
    this.type,
    this.title,
    this.onAddPressed,
    this.onFieldPressed,
    this.aims,
    this.aimActions,
    this.buttonColor,
  }) : super(key: key);

  final List<Widget> items;
  final QuestionnaireType? type;
  final String? title;
  final Color? buttonColor;
  final VoidCallback? onAddPressed;
  final Function(int index)? onFieldPressed;
  final List<Aim>? aims;
  final List<AimAction>? aimActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.mirror,
            colors: <Color>[
              Colors.white.withOpacity(1),
              Colors.white.withOpacity(0.4),
            ]),
        borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (type != null && onAddPressed != null)
            ListTile(
              title: Text(
                title!,
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: RoundButton(
                  onPressed: () {
                    onAddPressed!();
                  },
                  iconPath: 'assets/images/plus.svg',
                  color: buttonColor!),
            )
          else
            const SizedBox(),
          ...items,
          if (aims != null)
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: aims!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    aims![index].aim.toString(),
                  ),
                  dense: true,
                  onTap: () {
                    onFieldPressed!(index);
                    ProfileController.to.update();
                  },
                  trailing: RoundButton(
                    color: buttonColor!,
                    onPressed: () {
                      onFieldPressed!(index);
                      ProfileController.to.update();
                    },
                    iconPath: 'assets/images/dots.svg',
                  ),
                );
              },
            )
          else
            const SizedBox(),
          if (aimActions != null)
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: aimActions!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    aimActions![index].action.toString(),
                  ),
                  dense: true,
                  onTap: () {
                    onFieldPressed!(index);
                    ProfileController.to.update();
                  },
                  trailing: RoundButton(
                    color: buttonColor!,
                    onPressed: () {
                      onFieldPressed!(index);
                      ProfileController.to.update();
                    },
                    iconPath: 'assets/images/dots.svg',
                  ),
                );
              },
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}

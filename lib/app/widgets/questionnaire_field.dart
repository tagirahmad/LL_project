import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:l_l_app/app/constants/colors.dart';
import 'package:l_l_app/app/constants/dimensions.dart';
import 'package:l_l_app/app/modules/questionnaire/models/questionnaire_type.dart';

class QuestionnaireField extends StatelessWidget {
  const QuestionnaireField(
      {Key? key,
      this.title,
      required this.type,
      required this.onPressed,
      this.questionnaireField})
      : super(key: key);

  final String? title;
  final String? questionnaireField;
  final QuestionnaireType type;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.ITEM_INDENT),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title!,
                  style: type == QuestionnaireType.yearAim &&
                          type == QuestionnaireType.yearAim
                      ? Theme.of(context).textTheme.subtitle1
                      : Theme.of(context).textTheme.headline6,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: AppColors.LIGHT_BLUE,
                      padding: EdgeInsets.zero),
                  onPressed: onPressed,
                  child: SvgPicture.asset(
                    'assets/images/dots.svg',
                    height: Dimensions.SMALL_ICON_SIZE,
                    width: Dimensions.SMALL_ICON_SIZE,
                    cacheColorFilter: true,
                  ),
                )
              ],
            )
          else
            const SizedBox(),
          if (questionnaireField != null)
            Text(questionnaireField!)
          else
            const SizedBox(),
        ],
      ),
    );
  }
}

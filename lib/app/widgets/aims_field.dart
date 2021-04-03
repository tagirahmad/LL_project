import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';
import '../modules/questionnaire/models/questionnaire_type.dart';
import 'round_button.dart';

class AimsField extends StatelessWidget {
  const AimsField(
      {Key? key,
      required this.title,
      required this.type,
      required this.onPressed,
      required this.questionnaireField})
      : super(key: key);

  final String title;
  final String? questionnaireField;
  final QuestionnaireType type;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: Dimensions.ITEM_INDENT, horizontal: Dimensions.SIDE_INDENT),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              RoundButton(
                  onPressed: onPressed,
                  iconPath: 'assets/images/dots.svg',
                  color: AppColors.LIGHT_BLUE)
            ],
          ),
          if (questionnaireField != null)
            Text(questionnaireField!)
          else
            const SizedBox(),
        ],
      ),
    );
  }
}

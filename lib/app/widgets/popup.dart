import 'package:flutter/material.dart';
import '../modules/questionnaire/controllers/profile_controller.dart';
import '../modules/questionnaire/models/questionnaire_type.dart';

class Popup extends StatelessWidget {
  const Popup(
      {Key? key,
      required this.title,
      required this.hintText,
      this.onTapSave,
      required this.questionnaireType,
      this.index,
      // this.onUpdate,
      this.onDelete,
      this.onChanged})
      : super(key: key);

  final String title;
  final String hintText;
  final Function(
          String textEditingController, QuestionnaireType questionnaireType)?
      onTapSave;
  final QuestionnaireType questionnaireType;
  final int? index;
  // final Function(String keyboardValue, Rx<Profile> profile, int index)?
  //     onUpdate;
  final VoidCallback? onDelete;
  final Function(String?)? onChanged;

  dynamic? showInitialText(QuestionnaireType questionnaireType) {
    switch (questionnaireType) {
      case QuestionnaireType.name:
        return ProfileController.to.profile.value!.name ?? '';
      case QuestionnaireType.age:
        return ProfileController.to.profile.value!.age ?? '';
      case QuestionnaireType.city:
        return ProfileController.to.profile.value!.city ?? '';
      case QuestionnaireType.yearAim:
        if (index != null) {
          return ProfileController.to.profile.value!.yearAims?[index!].aim ??
              '';
        } else {
          return '';
        }
      case QuestionnaireType.lifeAim:
        if (index != null) {
          return ProfileController.to.profile.value!.lifeAims?[index!].aim ??
              '';
        } else {
          return '';
        }
      case QuestionnaireType.actions:
        if (index != null) {
          return ProfileController
                  .to.profile.value!.aimActions?[index!].action ??
              '';
        } else {
          return '';
        }
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: ProfileController.to.textEditingController
          ..text = showInitialText(questionnaireType).toString(),
        decoration: InputDecoration(hintText: hintText),
        keyboardType: questionnaireType == QuestionnaireType.age
            ? TextInputType.number
            : TextInputType.name,
        onChanged: onChanged,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (ProfileController.to.textEditingController.value.text != null &&
                ProfileController.to.textEditingController.value.text != '') {
              if (onTapSave != null) {
                onTapSave!(ProfileController.to.textEditingController.text,
                    questionnaireType);
              }
              Navigator.of(context).pop();
              ProfileController.to.textEditingController.clear();
            }
          },
          child: const Text('Сохранить'),
        ),
        if (index != null && onDelete != null)
          TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            onPressed: () {
              if (ProfileController.to.textEditingController.value.text !=
                      null &&
                  ProfileController.to.textEditingController.value.text != '') {
                onDelete!();
                Navigator.of(context).pop();
                ProfileController.to.textEditingController.clear();
              }
            },
            child: const Text('Удалить'),
          )
        else
          const SizedBox(),
        TextButton(
          onPressed: () {
            ProfileController.to.textEditingController.clear();
            Navigator.of(context).pop();
          },
          child: const Text('Закрыть'),
        ),
      ],
    );
  }
}

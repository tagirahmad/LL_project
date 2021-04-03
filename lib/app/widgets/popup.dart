import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../modules/questionnaire/controllers/profile_controller.dart';
import '../modules/questionnaire/models/profile.dart';
import '../modules/questionnaire/models/questionnaire_type.dart';

class Popup extends StatelessWidget {
  const Popup(
      {Key? key,
      required this.title,
      required this.hintText,
      this.onTapSave,
      required this.questionnaireType,
      this.index,
      this.onUpdate,
      this.onDelete})
      : super(key: key);

  final String title;
  final String hintText;
  final Function(String keyboardValue, Rx<Profile> profile)? onTapSave;
  final QuestionnaireType questionnaireType;
  final int? index;
  final Function(String keyboardValue, Rx<Profile> profile, int index)?
      onUpdate;
  final Function(Rx<Profile> userProfile, int index)? onDelete;

  dynamic? showInitialText(QuestionnaireType questionnaireType) {
    switch (questionnaireType) {
      case QuestionnaireType.name:
        return ProfileController.to.userProfile.value!.name ?? '';
      case QuestionnaireType.age:
        return ProfileController.to.userProfile.value!.age ?? '';
      case QuestionnaireType.city:
        return ProfileController.to.userProfile.value!.city ?? '';
      case QuestionnaireType.yearAim:
        if (index != null) {
          return ProfileController
                  .to.userProfile.value!.yearAims?[index!].aim ??
              '';
        } else {
          return '';
        }
      case QuestionnaireType.lifeAim:
        if (index != null) {
          return ProfileController
                  .to.userProfile.value!.lifeAims?[index!].aim ??
              '';
        } else {
          return '';
        }
      case QuestionnaireType.actions:
        if (index != null) {
          return ProfileController
                  .to.userProfile.value!.aimActions?[index!].action ??
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
        controller:
            ProfileController.to.hiveProfileService.textEditingController
              ..text = showInitialText(questionnaireType).toString(),
        decoration: InputDecoration(hintText: hintText),
        keyboardType: questionnaireType == QuestionnaireType.age
            ? TextInputType.number
            : TextInputType.name,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (ProfileController.to.hiveProfileService.textEditingController
                        .value.text !=
                    null &&
                ProfileController.to.hiveProfileService.textEditingController
                        .value.text !=
                    '') {
              if (index != null) {
                onUpdate!(
                    ProfileController
                        .to.hiveProfileService.textEditingController.value.text,
                    ProfileController.to.userProfile,
                    index!);
              } else {
                onTapSave!(
                    ProfileController
                        .to.hiveProfileService.textEditingController.value.text,
                    ProfileController.to.userProfile);
              }
              ProfileController.to.update();
              Navigator.of(context).pop();
              ProfileController.to.hiveProfileService.textEditingController
                  .clear();
            }
          },
          child: const Text('Сохранить'),
        ),
        if (index != null && onDelete != null)
          TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            onPressed: () {
              if (ProfileController.to.hiveProfileService.textEditingController
                          .value.text !=
                      null &&
                  ProfileController.to.hiveProfileService.textEditingController
                          .value.text !=
                      '') {
                onDelete!(ProfileController.to.userProfile, index!);
                ProfileController.to.update();
                Navigator.of(context).pop();
                ProfileController.to.hiveProfileService.textEditingController
                    .clear();
              }
            },
            child: const Text('Удалить'),
          )
        else
          const SizedBox(),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Закрыть'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:l_l_app/app/constants/colors.dart';
import 'package:l_l_app/app/constants/dimensions.dart';
import 'package:l_l_app/app/modules/questionnaire/controllers/profile_controller.dart';
import 'package:l_l_app/app/modules/questionnaire/models/aim.dart';
import 'package:l_l_app/app/modules/questionnaire/models/questionnaire_type.dart';
import 'package:l_l_app/app/widgets/popup.dart';
import 'package:l_l_app/app/widgets/profile_image.dart';
import 'package:l_l_app/app/widgets/questionnaire_container.dart';
import 'package:l_l_app/app/widgets/questionnaire_field.dart';
import 'package:l_l_app/app/widgets/round_button.dart';

import '../controllers/questionnaire_controller.dart';

class QuestionnaireView extends GetView<QuestionnaireController> {
  const QuestionnaireView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                'Главная',
                style: Theme.of(context).textTheme.headline6!,
              ),
              leading: const BackButton(color: Colors.black),
              pinned: false,
              floating: true,
              snap: true,
              backgroundColor: AppColors.BACKGROUND_COLOR,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.SIDE_INDENT),
            child:
                GetBuilder<ProfileController>(builder: (ProfileController p) {
              return Column(
                children: <Widget>[
                  ProfileImage(
                    onTap: () async {
                      await p.pickImage();
                      ProfileController.to.update();
                    },
                    imagePath: p.userProfile.value!.profileImagePath,
                  ),
                  const SizedBox(
                    height: Dimensions.ITEM_INDENT,
                  ),
                  QuestionnaireContainer(items: <Widget>[
                    ListTile(
                      title: Text(
                        'Имя',
                        style: Theme.of(context).textTheme.headline6!,
                      ),
                      subtitle: Text(p.userProfile.value?.name ?? ''),
                      onTap: () {
                        showDialog<Widget>(
                            context: context,
                            builder: (BuildContext context) {
                              return Popup(
                                  title: 'Имя',
                                  hintText: 'Введите Ваше имя',
                                  questionnaireType: QuestionnaireType.name,
                                  onTapSave: p.hiveProfileService.putName);
                            });
                      },
                      trailing: RoundButton(
                        color: AppColors.LIGHT_BLUE,
                        onPressed: () {
                          showDialog<Widget>(
                              context: context,
                              builder: (BuildContext context) {
                                return Popup(
                                    title: 'Имя',
                                    hintText: 'Введите Ваше имя',
                                    questionnaireType: QuestionnaireType.name,
                                    onTapSave: p.hiveProfileService.putName);
                              });
                        },
                        iconPath: 'assets/images/dots.svg',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Возраст',
                        style: Theme.of(context).textTheme.headline6!,
                      ),
                      subtitle: Text((p.userProfile.value?.age != null
                          ? p.userProfile.value?.age.toString()
                          : '')!),
                      onTap: () {
                        showDialog<Widget>(
                            context: context,
                            builder: (BuildContext context) {
                              return Popup(
                                  title: 'Возраст',
                                  hintText: 'Введите Ваш возраст',
                                  questionnaireType: QuestionnaireType.age,
                                  onTapSave: p.hiveProfileService.putAge);
                            });
                      },
                      trailing: RoundButton(
                        color: AppColors.LIGHT_BLUE,
                        onPressed: () {
                          showDialog<Widget>(
                              context: context,
                              builder: (BuildContext context) {
                                return Popup(
                                    title: 'Возраст',
                                    hintText: 'Введите Ваш возраст',
                                    questionnaireType: QuestionnaireType.age,
                                    onTapSave: p.hiveProfileService.putAge);
                              });
                        },
                        iconPath: 'assets/images/dots.svg',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Город проживания',
                        style: Theme.of(context).textTheme.headline6!,
                      ),
                      subtitle: Text(p.userProfile.value?.city ?? ''),
                      onTap: () {
                        showDialog<Widget>(
                            context: context,
                            builder: (BuildContext context) {
                              return Popup(
                                  title: 'Город',
                                  hintText: 'Введите Ваш город',
                                  questionnaireType: QuestionnaireType.city,
                                  onTapSave: p.hiveProfileService.putCity);
                            });
                      },
                      trailing: RoundButton(
                        color: AppColors.LIGHT_BLUE,
                        onPressed: () {
                          showDialog<Widget>(
                              context: context,
                              builder: (BuildContext context) {
                                return Popup(
                                    title: 'Город',
                                    hintText: 'Введите Ваш город',
                                    questionnaireType: QuestionnaireType.city,
                                    onTapSave: p.hiveProfileService.putCity);
                              });
                        },
                        iconPath: 'assets/images/dots.svg',
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: Dimensions.ITEM_INDENT,
                  ),
                  QuestionnaireContainer(
                    title: 'Цели на год',
                    type: QuestionnaireType.yearAim,
                    buttonColor: AppColors.LIGHT_PURPLE,
                    onAddPressed: () {
                      showDialog<Widget>(
                          context: context,
                          builder: (BuildContext context) {
                            return Popup(
                                title: 'Цель',
                                hintText: 'Ваша Цель',
                                questionnaireType: QuestionnaireType.yearAim,
                                onTapSave: p.hiveProfileService.putYearAim);
                          });
                    },
                    items: const <Widget>[],
                    aims: p.userProfile.value!.yearAims,
                    onFieldPressed: (int index) {
                      showDialog<Widget>(
                          context: context,
                          builder: (BuildContext context) {
                            return Popup(
                                title: 'Цель',
                                hintText: 'Ваша цель',
                                questionnaireType: QuestionnaireType.yearAim,
                                index: index,
                                onUpdate: p.hiveProfileService.updateYearAim,
                                onDelete: p.hiveProfileService.removeYearAimFromStore);
                          });
                    },
                  ),
                  const SizedBox(
                    height: Dimensions.ITEM_INDENT,
                  ),
                  QuestionnaireContainer(
                    title: 'Цели на жизнь',
                    type: QuestionnaireType.lifeAim,
                    buttonColor: AppColors.LIGHT_PINK,
                    onAddPressed: () {
                      showDialog<Widget>(
                          context: context,
                          builder: (BuildContext context) {
                            return Popup(
                                title: 'Цель',
                                hintText: 'Ваша Цель',
                                questionnaireType: QuestionnaireType.lifeAim,
                                onTapSave: p.hiveProfileService.putLifeAim);
                          });
                    },
                    items: const <Widget>[],
                    aims: p.userProfile.value!.lifeAims,
                    onFieldPressed: (int index) {
                      showDialog<Widget>(
                          context: context,
                          builder: (BuildContext context) {
                            return Popup(
                                title: 'Цель',
                                hintText: 'Ваша цель',
                                questionnaireType: QuestionnaireType.lifeAim,
                                index: index,
                                onUpdate: p.hiveProfileService.updateLifeAim,
                                onDelete: p.hiveProfileService.removeLifeAimFromStore);
                          });
                    },
                  ),
                  const SizedBox(
                    height: Dimensions.ITEM_INDENT,
                  ),
                  QuestionnaireContainer(
                    title: 'Действия для достижения целей',
                    type: QuestionnaireType.lifeAim,
                    buttonColor: AppColors.LIGHT_YELLOW,
                    onAddPressed: () {
                      showDialog<Widget>(
                          context: context,
                          builder: (BuildContext context) {
                            return Popup(
                                title: 'Действие',
                                hintText: 'Действи для достижения целей',
                                questionnaireType: QuestionnaireType.actions,
                                onTapSave: p.hiveProfileService.putAimAction);
                          });
                    },
                    items: const <Widget>[],
                    aimActions: p.userProfile.value!.aimActions,
                    onFieldPressed: (int index) {
                      showDialog<Widget>(
                          context: context,
                          builder: (BuildContext context) {
                            return Popup(
                                title: 'Действие',
                                hintText: 'Действи для достижения целей',
                                questionnaireType: QuestionnaireType.actions,
                                index: index,
                                onUpdate: p.hiveProfileService.updateAimAction,
                                onDelete:
                                    p.hiveProfileService.removeAimActionFromStore);
                          });
                    },
                  ),
                  const SizedBox(
                    height: Dimensions.ITEM_INDENT,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

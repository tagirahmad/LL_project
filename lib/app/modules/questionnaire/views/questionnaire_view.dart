import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../widgets/popup.dart';
import '../../../widgets/profile_image.dart';
import '../../../widgets/questionnaire_container.dart';
import '../../../widgets/round_button.dart';
import '../controllers/profile_controller.dart';
import '../controllers/questionnaire_controller.dart';
import '../helpers/on_profile_text_changed.dart';
import '../models/questionnaire_type.dart';

class QuestionnaireView extends GetView<QuestionnaireController> {
  const QuestionnaireView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
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
            child: GetBuilder<ProfileController>(builder: (p) {
              return Column(
                children: <Widget>[
                  ProfileImage(
                    onTap: () async {
                      await p.pickImage();
                      ProfileController.to.update();
                    },
                    imagePath: p.profile.value!.profileImagePath,
                  ),
                  const SizedBox(
                    height: Dimensions.ITEM_INDENT,
                  ),
                  QuestionnaireContainer(items: <Widget>[
                    ListTile(
                      title: Text(
                        'Имя',
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(
                            top: Dimensions.ITEM_INDENT - 5),
                        child: Text(
                          p.profile.value?.name ?? '',
                          style: Theme.of(context).textTheme.headline6!,
                        ),
                      ),
                      onTap: () {
                        showDialog<Widget>(
                            context: context,
                            builder: (context) {
                              return Popup(
                                title: 'Имя',
                                hintText: 'Введите Ваше имя',
                                questionnaireType: QuestionnaireType.name,
                                onChanged: (text) =>
                                    OnProfileTextChangedHelper.onChangedName(
                                        text!, p),
                              );
                            });
                      },
                      trailing: RoundButton(
                        color: AppColors.LIGHT_BLUE,
                        onPressed: () {
                          showDialog<Widget>(
                              context: context,
                              builder: (context) {
                                return Popup(
                                  title: 'Имя',
                                  hintText: 'Введите Ваше имя',
                                  questionnaireType: QuestionnaireType.name,
                                  onChanged: (text) =>
                                      OnProfileTextChangedHelper.onChangedName(
                                          text!, p),
                                );
                              });
                        },
                        iconPath: 'assets/images/dots.svg',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Возраст',
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(
                            top: Dimensions.SIDE_INDENT - 5),
                        child: Text(
                          (p.profile.value?.age != null
                              ? p.profile.value?.age.toString()
                              : '')!,
                          style: Theme.of(context).textTheme.headline6!,
                        ),
                      ),
                      onTap: () {
                        showDialog<Widget>(
                            context: context,
                            builder: (context) {
                              return Popup(
                                title: 'Возраст',
                                hintText: 'Введите Ваш возраст',
                                questionnaireType: QuestionnaireType.age,
                                onChanged: (text) =>
                                    OnProfileTextChangedHelper.onChangedAge(
                                        text!, p),
                              );
                            });
                      },
                      trailing: RoundButton(
                        color: AppColors.LIGHT_BLUE,
                        onPressed: () {
                          showDialog<Widget>(
                              context: context,
                              builder: (context) {
                                return Popup(
                                  title: 'Возраст',
                                  hintText: 'Введите Ваш возраст',
                                  questionnaireType: QuestionnaireType.age,
                                  onChanged: (text) =>
                                      OnProfileTextChangedHelper.onChangedAge(
                                          text!, p),
                                );
                              });
                        },
                        iconPath: 'assets/images/dots.svg',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Город проживания',
                      ),
                      subtitle: Padding(
                          padding: const EdgeInsets.only(
                              top: Dimensions.SIDE_INDENT - 5),
                          child: Text(p.profile.value?.city ?? '',
                              style: Theme.of(context).textTheme.headline6!)),
                      onTap: () {
                        showDialog<Widget>(
                            context: context,
                            builder: (context) {
                              return Popup(
                                title: 'Город',
                                hintText: 'Введите Ваш город',
                                questionnaireType: QuestionnaireType.city,
                                onChanged: (text) =>
                                    OnProfileTextChangedHelper.onChangedCity(
                                        text!, p),
                              );
                            });
                      },
                      trailing: RoundButton(
                        color: AppColors.LIGHT_BLUE,
                        onPressed: () {
                          showDialog<Widget>(
                              context: context,
                              builder: (context) {
                                return Popup(
                                  title: 'Город',
                                  hintText: 'Введите Ваш город',
                                  questionnaireType: QuestionnaireType.city,
                                  onChanged: (text) =>
                                      OnProfileTextChangedHelper.onChangedCity(
                                          text!, p),
                                );
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
                          builder: (context) {
                            return Popup(
                                title: 'Цель',
                                hintText: 'Ваша Цель',
                                questionnaireType: QuestionnaireType.yearAim,
                                onTapSave: p.saveItemToStore);
                          });
                    },
                    items: const <Widget>[],
                    aims: p.profile.value!.yearAims,
                    onFieldPressed: (index) {
                      showDialog<Widget>(
                          context: context,
                          builder: (context) {
                            return Popup(
                                title: 'Цель',
                                hintText: 'Ваша цель',
                                questionnaireType: QuestionnaireType.yearAim,
                                index: index,
                                onChanged: (text) =>
                                    OnProfileTextChangedHelper.onChangedYearAim(
                                        text!, p, index),
                                onDelete: () => p.removeItemFromStore(
                                    index, QuestionnaireType.yearAim));
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
                          builder: (context) {
                            return Popup(
                                title: 'Цель',
                                hintText: 'Ваша Цель',
                                questionnaireType: QuestionnaireType.lifeAim,
                                onTapSave: p.saveItemToStore);
                          });
                    },
                    items: const <Widget>[],
                    aims: p.profile.value!.lifeAims,
                    onFieldPressed: (index) {
                      showDialog<Widget>(
                          context: context,
                          builder: (context) {
                            return Popup(
                                title: 'Цель',
                                hintText: 'Ваша цель',
                                questionnaireType: QuestionnaireType.lifeAim,
                                index: index,
                                onChanged: (text) =>
                                    OnProfileTextChangedHelper.onChangedLifeAim(
                                        text!, p, index),
                                onDelete: () => p.removeItemFromStore(
                                    index, QuestionnaireType.lifeAim));
                          });
                    },
                  ),
                  const SizedBox(
                    height: Dimensions.ITEM_INDENT,
                  ),
                  QuestionnaireContainer(
                    title: 'Действия для достижения целей',
                    type: QuestionnaireType.actions,
                    buttonColor: AppColors.LIGHT_YELLOW,
                    onAddPressed: () {
                      showDialog<Widget>(
                          context: context,
                          builder: (context) {
                            return Popup(
                                title: 'Действие',
                                hintText: 'Действие для достижения целей',
                                questionnaireType: QuestionnaireType.actions,
                                onTapSave: p.saveItemToStore);
                          });
                    },
                    items: const <Widget>[],
                    aimActions: p.profile.value!.aimActions,
                    onFieldPressed: (index) {
                      showDialog<Widget>(
                          context: context,
                          builder: (context) {
                            return Popup(
                                title: 'Действие',
                                hintText: 'Действие для достижения целей',
                                questionnaireType: QuestionnaireType.actions,
                                index: index,
                                onChanged: (text) => OnProfileTextChangedHelper
                                    .onChangedAimAction(text!, p, index),
                                onDelete: () => p.removeItemFromStore(
                                    index, QuestionnaireType.actions));
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

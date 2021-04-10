import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../constants/links.dart';
import '../../../constants/work_articles.dart';
import '../../../routes/app_pages.dart';
import '../../../services/url_launcher_service.dart';
import '../../../widgets/work_card.dart';
import '../controllers/work_controller.dart';
import '../models/article.dart';

class WorkView extends GetView<WorkController> {
  const WorkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text(
                    'Работа',
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/woman.svg',
                      cacheColorFilter: true,
                    ),
                    const SizedBox(height: Dimensions.ITEM_INDENT),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <WorkCard>[
                        WorkCard(
                            color: AppColors.LIGHT_GREEN,
                            onPress: () {
                              Get.toNamed(Routes.WORK_ARTICLE,
                                  arguments: Article(
                                      text: cvArticle, title: 'Резюме'));
                            },
                            title: 'Резюме',
                            iconPath: 'assets/images/star.svg'),
                        WorkCard(
                            color: AppColors.LIGHT_YELLOW,
                            onPress: () {
                              Get.toNamed(Routes.WORK_ARTICLE,
                                  arguments: Article(
                                      text: findWorkArticle,
                                      title: 'Поиск работы'));
                            },
                            title: 'Поиск работы',
                            iconPath: 'assets/images/find.svg')
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <WorkCard>[
                        WorkCard(
                            color: AppColors.LIGHT_PINK,
                            onPress: () {
                              Get.toNamed(Routes.WORK_ARTICLE,
                                  arguments: Article(
                                      text: reviewArticle,
                                      title: 'Собеседование'));
                            },
                            title: 'Собеседование',
                            iconPath: 'assets/images/video.svg'),
                        WorkCard(
                            color: AppColors.CYAN,
                            onPress: () {
                              UrlLauncherService.launchURL(Links.hh);
                            },
                            title: 'Вакансии',
                            iconPath: 'assets/images/vacancy.svg')
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}

import 'package:get/get.dart';

import 'package:l_l_app/app/modules/aim_map/bindings/aim_map_binding.dart';
import 'package:l_l_app/app/modules/aim_map/views/aim_map_view.dart';

import '../modules/additional_income/bindings/additional_income_binding.dart';
import '../modules/additional_income/views/additional_income_view.dart';
import '../modules/app/bindings/app_binding.dart';
import '../modules/app/views/app_view.dart';
import '../modules/finace/bindings/finace_binding.dart';
import '../modules/finace/views/finace_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro/bindings/intro_binding.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/questionnaire/bindings/questionnaire_binding.dart';
import '../modules/questionnaire/views/questionnaire_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/work/bindings/work_binding.dart';
import '../modules/work/views/work_article_view.dart';
import '../modules/work/views/work_view.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const String INITIAL = Routes.SPLASH;

  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FINACE,
      page: () => const FinanceView(),
      binding: FinaceBinding(),
    ),
    GetPage(
      name: _Paths.QUESTIONNAIRE,
      page: () => const QuestionnaireView(),
      binding: QuestionnaireBinding(),
    ),
    GetPage(
      name: _Paths.WORK,
      page: () => const WorkView(),
      binding: WorkBinding(),
    ),
    GetPage(
      name: _Paths.WORK_ARTICLE,
      page: () => WorkArticleView(),
      binding: WorkBinding(),
    ),
    GetPage(
      name: _Paths.ADDITIONAL_INCOME,
      page: () => const AdditionalIncomeView(),
      binding: AdditionalIncomeBinding(),
    ),
    GetPage(
      name: _Paths.APP,
      page: () => AppView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.AIM_MAP,
      page: () => AimMapView(),
      binding: AimMapBinding(),
    ),
  ];
}

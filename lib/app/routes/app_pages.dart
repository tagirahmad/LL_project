import 'package:get/get.dart';

import '../modules/additional_income/bindings/additional_income_binding.dart';
import '../modules/additional_income/views/additional_income_view.dart';
import '../modules/app/bindings/app_binding.dart';
import '../modules/app/views/app_view.dart';
import '../modules/finace/bindings/finace_binding.dart';
import '../modules/finace/views/finace_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/questionnaire/bindings/questionnaire_binding.dart';
import '../modules/questionnaire/views/questionnaire_view.dart';
import '../modules/work/bindings/work_binding.dart';
import '../modules/work/views/work_article_view.dart';
import '../modules/work/views/work_view.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const String INITIAL = Routes.HOME;

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
  ];
}

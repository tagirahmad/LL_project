import 'package:get/get.dart';

import 'package:l_l_app/app/modules/additional_income/bindings/additional_income_binding.dart';
import 'package:l_l_app/app/modules/additional_income/views/additional_income_view.dart';
import 'package:l_l_app/app/modules/finace/bindings/finace_binding.dart';
import 'package:l_l_app/app/modules/finace/views/finace_view.dart';
import 'package:l_l_app/app/modules/home/bindings/home_binding.dart';
import 'package:l_l_app/app/modules/home/views/home_view.dart';
import 'package:l_l_app/app/modules/questionnaire/bindings/questionnaire_binding.dart';
import 'package:l_l_app/app/modules/questionnaire/views/questionnaire_view.dart';
import 'package:l_l_app/app/modules/work/bindings/work_binding.dart';
import 'package:l_l_app/app/modules/work/views/work_view.dart';

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
      name: _Paths.ADDITIONAL_INCOME,
      page: () => const AdditionalIncomeView(),
      binding: AdditionalIncomeBinding(),
    ),
  ];
}

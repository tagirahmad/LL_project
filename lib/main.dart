import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/constants/colors.dart';
import 'app/modules/finace/model/bank.dart' show Bank, BankAdapter;
import 'app/modules/finace/model/expenses.dart';
import 'app/modules/finace/model/finance.dart';
import 'app/modules/finace/model/fund.dart';
import 'app/modules/finace/model/income.dart';
import 'app/modules/finace/model/pocket.dart';
import 'app/modules/questionnaire/models/aim_action.dart';
import 'app/modules/questionnaire/models/life_aim.dart';
import 'app/modules/questionnaire/models/profile.dart';
import 'app/modules/questionnaire/models/year_aim.dart';
import 'app/routes/app_pages.dart';
import 'app/services/local_notifications.dart';

// ignore: avoid_void_async
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<YearAim>(YearAimAdapter());
  Hive.registerAdapter<LifeAim>(LifeAimAdapter());
  Hive.registerAdapter<AimAction>(AimActionAdapter());
  Hive.registerAdapter<Profile>(ProfileAdapter());
  Hive.registerAdapter<Finance>(FinanceAdapter());
  Hive.registerAdapter<Income>(IncomeAdapter());
  Hive.registerAdapter<Fund>(FundAdapter());
  Hive.registerAdapter<Expenses>(ExpensesAdapter());
  Hive.registerAdapter<PocketMoney>(PocketMoneyAdapter());
  Hive.registerAdapter<Bank>(BankAdapter());
  await Hive.openBox<Profile>('profile');
  await Hive.openBox<Finance>('finance');

  await LocalNotifications().init();

  runApp(
    GetMaterialApp(
        title: 'Application',
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
            textTheme: const TextTheme(),
            primaryColor: AppColors.BACKGROUND_COLOR,
            accentColor: AppColors.BACKGROUND_COLOR,
            scaffoldBackgroundColor: AppColors.BACKGROUND_COLOR,
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all<Color>(
                        AppColors.BACKGROUND_COLOR))),
            appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.BACKGROUND_COLOR))),
  );
}

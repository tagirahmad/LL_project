import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'app/constants/colors.dart';
import 'app/modules/aim_map/models/aim_map.dart';
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
import 'app/services/credentials_service.dart';
import 'app/services/subscription_status.dart';

Future<void> initPlatformState(String revenueCatApiKey) async {
  isPro.isPro = false;

  await Purchases.setDebugLogsEnabled(true);
  await Purchases.setup(revenueCatApiKey,
      appUserId: await PlatformDeviceId.getDeviceId);

  PurchaserInfo purchaserInfo;
  try {
    purchaserInfo = await Purchases.getPurchaserInfo();
    print(purchaserInfo.toString());
    if (purchaserInfo.entitlements.all['pro'] != null) {
      isPro.isPro = purchaserInfo.entitlements.all['pro']!.isActive;
      isPro.isPro
          ? OneSignal.shared.sendTag('pro', true)
          : OneSignal.shared.sendTag('pro', false);
    } else {
      isPro.isPro = false;
      OneSignal.shared.sendTag('pro', false);
    }
  } on PlatformException catch (e) {
    print(e);
  }

  print('#### is user pro? ${isPro.isPro}');
}

Future<void> initHiveDb() async {
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
  Hive.registerAdapter<AimMap>(AimMapAdapter());
  await Hive.openBox<Profile>('profile');
  await Hive.openBox<Finance>('finance');
  await Hive.openBox<AimMap>('aimMap');
}

Future<void> initOneSignal(String oneSignalAppId) async {
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.init(oneSignalAppId, iOSSettings: {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.inAppLaunchUrl: false
  });
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);

  await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final credentials = await Credentials.fromFile('credentials.json');

  await initPlatformState(credentials.revenueCatApiKey);
  await initHiveDb();
  await initOneSignal(credentials.oneSignalAppId);

  runApp(
    GetMaterialApp(
      title: 'Курс на достаток и свободу',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ru', ''), // Russian, no country code
      ],
      theme: ThemeData(
        textTheme: const TextTheme(),
        primaryColor: AppColors.BACKGROUND_COLOR,
        accentColor: AppColors.BACKGROUND_COLOR,
        scaffoldBackgroundColor: AppColors.BACKGROUND_COLOR,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all<Color>(AppColors.BACKGROUND_COLOR),
          ),
        ),
        appBarTheme:
            const AppBarTheme(backgroundColor: AppColors.BACKGROUND_COLOR),
      ),
    ),
  );
}

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../constants/subscription_list.dart';
import '../modules/finace/controllers/finance_controller.dart';
import 'subscription_status.dart';

class PurchaseService {
  static final PurchaseService _singleton = PurchaseService._internal();

  factory PurchaseService() {
    return _singleton;
  }

  PurchaseService._internal();

  static Future<void> makePurchase(Package package, String identifier) async {
    try {
      var pInfo = await Purchases.getPurchaserInfo();

      var subscriptions = subscriptionsList
          .where((element) => element != package.identifier)
          .toList();

      for (var item in subscriptions) {
        if (pInfo.activeSubscriptions.contains(item)) {
          var purchaserInfo;
          if (package.identifier != "\$rc_lifetime") {
            purchaserInfo = await Purchases.purchasePackage(package,
                upgradeInfo: UpgradeInfo(item));
            OneSignal.shared.sendTag('pro', true);
          } else {
            print(pInfo.entitlements.all[identifier]);
            purchaserInfo = await Purchases.purchasePackage(package);
            OneSignal.shared.sendTag('pro', true);
          }

          var isProInfo = purchaserInfo.entitlements.all[identifier]?.isActive;

          if (isProInfo != null && isProInfo == true) {
            // Unlock that great "pro" content
            isPro.isPro = true;
            Get.put(FinanceController());
            FinanceController.to.subscriptionStatus.value = true;
            OneSignal.shared.sendTag('pro', true);
          }
        }
      }

      pInfo = await Purchases.getPurchaserInfo();
      if (pInfo.entitlements.all[identifier]?.isActive != null &&
          pInfo.entitlements.all[identifier]?.isActive == true) {
        isPro.isPro = true;
        Get.put(FinanceController());
        FinanceController.to.subscriptionStatus.value = true;
        OneSignal.shared.sendTag('pro', true);
      } else {
        var purchaserInfo = await Purchases.purchasePackage(package);
        var isProInfo = purchaserInfo.entitlements.all[identifier]?.isActive;
        if (isProInfo != null && isProInfo == true) {
          // Unlock that great "pro" content
          isPro.isPro = true;
          FinanceController.to.subscriptionStatus.value = true;
          OneSignal.shared.sendTag('pro', true);
        }
      }
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        // showError(e);
      }
      // Purchases.
    }
  }

  static Future<void> restorePurchases() async {
    try {
      var restoredInfo = await Purchases.restoreTransactions();
      print(restoredInfo);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}

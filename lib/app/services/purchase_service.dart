import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseService {
  static final PurchaseService _singleton = PurchaseService._internal();

  factory PurchaseService() {
    return _singleton;
  }

  PurchaseService._internal();

  static Future<void> makePurchase(Package package, String identifier) async {
    try {
      var purchaserInfo = await Purchases.purchasePackage(package);
      var isPro = purchaserInfo.entitlements.all[identifier]!.isActive;
      if (isPro) {
        // Unlock that great "pro" content
      }
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        // showError(e);
      }
    }
  }
}

import 'dart:convert';

import 'package:flutter/services.dart';

class Credentials {
  Credentials._internal();

  late String _oneSignalAppId;
  late String _revenueCatApiKey;

  static final Credentials _singleton = Credentials._internal();

  String get oneSignalAppId => _oneSignalAppId;
  String get revenueCatApiKey => _revenueCatApiKey;

  factory Credentials.fromJson(Map<String, dynamic> json) {
    _singleton._oneSignalAppId = json['onesignal_app_id'] as String;
    _singleton._revenueCatApiKey = json['revenue_cat_api_key'] as String;
    return _singleton;
  }

  static Future<Credentials> fromFile(String fileName) async {
    return Credentials.fromJson(
      json.decode(
        // File(fileName).readAsStringSync(),
        await rootBundle.loadString('assets/$fileName'),
      ) as Map<String, dynamic>,
    );
  }
}

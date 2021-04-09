import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static final UrlLauncherService _singleton = UrlLauncherService._internal();

  factory UrlLauncherService() {
    return _singleton;
  }

  UrlLauncherService._internal();

  static void launchURL(String link) async => await canLaunch(link)
      ? await launch(link)
      : throw 'Could not launch $link';
}

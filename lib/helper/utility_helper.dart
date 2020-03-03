import 'package:url_launcher/url_launcher.dart';

class UtilityHelper {
  static void openBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

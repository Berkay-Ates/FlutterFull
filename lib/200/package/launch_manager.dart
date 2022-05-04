import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  void launchURL(Uri _uri) async {
    if (await canLaunchUrl(_uri)) {
      await launchUrl(_uri);
    }
  }
}

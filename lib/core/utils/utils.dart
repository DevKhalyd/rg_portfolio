import 'package:url_launcher/url_launcher.dart';

abstract class Utils {
  /// Set to true to avoid update some data in the database
  static const isDebugging = true;

  static const host = "https://rolando-garcia.netlify.app/#/";

  static const appName = 'RG Portfolio';

  /// The font for the Google letters
  static const readexProFont = 'ReadexPro';

  /// Just a temp image...
  static const tempImage = 'assets/img/profile.png';

  static const name = 'Rolando Garcia';

  static const email = 'rolandocontactme@gmail.com';

  static const githubUrl = 'https://github.com/DevKhalyd';

  static const linkedInUrl =
      'https://www.linkedin.com/in/rolando-garcia-74b274161/';

  static const stackOverflowUrl =
      'https://stackoverflow.com/users/10942018/rolando-garcia';

  static const websiteRepoUrl = 'https://github.com/DevKhalyd/rg_portfolio';

  static void launchURL(String url) async {
    // Verify that contains https

    if (await canLaunchUrl(Uri.parse(url))) {
      launchUrl(Uri.parse(url));
    }
  }

  /// [complement] Example: aboutMe
  /// Result: https://rolando-garcia.netlify.app/#/aboutMe
  static String getUrlForOwnWebsite(String complement) {
    return host + complement;
  }

  static String getUrlForGithub(String complement) {
    return 'https://www.github.com/$complement';
  }
}

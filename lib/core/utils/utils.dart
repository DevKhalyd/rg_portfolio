import 'package:url_launcher/url_launcher.dart';

abstract class Utils {

  static const host = "https://rolando-garcia.netlify.app";

  static const appName = 'RG Portfolio';

  /// The font for the Google letters
  static const readexProFont = 'ReadexPro';

  /// Just a temp image...
  static const tempImage = 'assets/img/profile.png';

  static const name = 'Roland Garcia';

  static const email = 'rolando.garcia.office@gmail.com';

  static const githubUrl = 'https://github.com/DevKhalyd';

  static const linkedInUrl =
      'https://www.linkedin.com/in/rolando-garcia-74b274161/';

  static const stackOverflowUrl =
      'https://stackoverflow.com/users/10942018/rolando-garcia';

  static const websiteRepoUrl = 'https://github.com/DevKhalyd/rg_portfolio';

  static void launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      launchUrl(Uri.parse(url));
    }
  }

  // TODO: Create a method that gets the host from the environment
  // and validates if the current platform is web or not to provide a correct route

  /// [complement] Example: aboutMe, ticTacToe, rgProjects
  /// 
  /// Result: https://rolando-garcia.netlify.app/[complement]
  static String getUrlForOwnWebsite([String complement = '']) {
    return host + complement;
  }

  /// [complement] Example: Any projected stored in GitHub
  /// 
  /// Result: https://www.github.com/DevKhalyd/[complement]
  static String getUrlForGithub([String complement = '']) {
    return 'https://www.github.com/DevKhalyd/$complement';
  }
}

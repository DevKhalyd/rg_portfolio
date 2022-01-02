import 'package:rg_portfolio/core/utils/utils.dart';

/// The logic for the HomeRepository
class HomeRepository {
  bool _isMenuOpen = false;

  bool get isMenuOpen => _isMenuOpen;

  void toggleMenu([bool? newState]) {
    if (newState != null) {
      if (newState != _isMenuOpen) _isMenuOpen = newState;
    } else {
      _isMenuOpen = !_isMenuOpen;
    }
  }

  openGitHub() {
    Utils.launchURL(Utils.githubUrl);
  }

  openLinkedIn() {
    Utils.launchURL(Utils.linkedInUrl);
  }
}

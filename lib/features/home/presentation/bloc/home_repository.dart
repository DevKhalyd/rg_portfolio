import '../../../../core/utils/utils.dart';
import '../../domain/usecases/searcher_item.dart';

/// The logic for the HomeRepository
class HomeRepository {
  final _searchItems = [
    SearchItem(label: 'About me'),
    SearchItem(label: 'Projects'),
    SearchItem(label: 'More...'),
  ];

  List<SearchItem> get searchItems => _searchItems;

  bool _isMenuOpen = false;

  bool get isMenuOpen => _isMenuOpen;

  void toggleMenu([bool? newState]) {
    if (newState != null) {
      if (newState != _isMenuOpen) _isMenuOpen = newState;
    } else {
      _isMenuOpen = !_isMenuOpen;
    }
  }

  void changeSearchItem(SearchItem item) {
    for (var element in _searchItems) {
      if (element.label == item.label) {
        element.wasSelected = true;
        break;
      }
    }
  }

  void openGitHub() => Utils.launchURL(Utils.githubUrl);

  void openLinkedIn() => Utils.launchURL(Utils.linkedInUrl);
}

import '../../../../core/utils/utils.dart';
import '../../domain/usecases/searcher_item.dart';

final _searchItems = [
  SearchItem(label: 'About Me'),
  SearchItem(label: 'Projects'),
];

/// The logic for the HomeRepository
class HomeRepository {
  List<SearchItem> get searchItems => _searchItems;

  SearchItem _currentSearchItem = _searchItems[0];

  /// Current item showing to the user
  SearchItem get currentSearchItem => _currentSearchItem;

  bool _isMenuOpen = false;

  bool get isMenuOpen => _isMenuOpen;

  void toggleMenu([bool? newState]) {
    if (newState != null) {
      if (newState != _isMenuOpen) _isMenuOpen = newState;
    } else {
      _isMenuOpen = !_isMenuOpen;
    }
  }

  void updateSearchItem(SearchItem item) {
    for (var element in _searchItems) {
      if (element.label == item.label) {
        element.wasSelected = true;
        _currentSearchItem = element;
        break;
      }
    }
  }

  void openGitHub() => Utils.launchURL(Utils.githubUrl);

  void openLinkedIn() => Utils.launchURL(Utils.linkedInUrl);
}

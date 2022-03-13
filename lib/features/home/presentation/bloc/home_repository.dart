import '../../../../core/utils/utils.dart';
import '../../data/api/home_cloud_firestore_repository.dart';
import '../../domain/usecases/searcher_item.dart';
import '../widgets/shared/lists_of_results.dart';

final _searchItems = getSearchItems();

/// The logic for the HomeRepository
class HomeRepository {
  HomeRepository(HomeCloudFirestoreRepository cloudRepo)
      : _cloudRepo = cloudRepo;

  final HomeCloudFirestoreRepository _cloudRepo;

  List<SearchItem> get searchItems => _searchItems;

  SearchItem _currentSearchItem = _searchItems[0];

  /// Current item showing to the user
  SearchItem get currentSearchItem => _currentSearchItem;

  /// If true the views don't should be updated again
  bool _viewsWasUpdated = false;

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

  /// Update the views in the database just once per session
  void updateViews() {
    if (_viewsWasUpdated) return;
    _cloudRepo.updateTotalViews();
    _viewsWasUpdated = true;
  }

  /// Get the viws for the app bar
  Future<int> getTotalViews() => _cloudRepo.getTotalViews();
}

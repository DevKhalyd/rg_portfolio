import 'dart:math';

import 'package:flutter/foundation.dart';

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

  bool _isMenuOpen = false;

  bool get isMenuOpen => _isMenuOpen;

  void toggleMenu([bool? newState]) {
    if (newState != null) {
      if (newState != _isMenuOpen) _isMenuOpen = newState;
    } else {
      _isMenuOpen = !_isMenuOpen;
    }
  }

  /// Update the list of seach items by putting the selected item in purple color
  /// like chrome does when select a result
  @Deprecated('Use the function updateSearchItem from Riverpod')
  void updateSearchItem(SearchItem item) {
    for (final element in _searchItems) {
      if (element.label == item.label) {
        element.wasSelected = true;
        _currentSearchItem = element;
        break;
      }
    }
  }

  @Deprecated('Use the function openGitHub from Riverpod')
  void openGitHub() => Utils.launchURL(Utils.githubUrl);

  @Deprecated('Use the function openLinkedIn from Riverpod')
  void openLinkedIn() => Utils.launchURL(Utils.linkedInUrl);

  /// Update the views in the database just once per session
  /// TODO: Find a better way to call this function according to CA
  void updateViews() {
    if (kDebugMode) return;
    _cloudRepo.updateTotalViews();
  }

  /// Get the views for the app bar
  Future<int> getTotalViews() => _cloudRepo.getTotalViews();

  SearchItem getRandomSearchItem() {
    final random = Random();
    final index = random.nextInt(_searchItems.length - 1);
    return _searchItems[index];
  }
}

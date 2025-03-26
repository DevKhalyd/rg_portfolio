import 'package:flutter/foundation.dart';

import '../../data/api/home_cloud_firestore_repository.dart';

/// The logic for the HomeRepository

@Deprecated('Use Riverpod approach')
class HomeRepository {
  HomeRepository(HomeCloudFirestoreRepository cloudRepo)
    : _cloudRepo = cloudRepo;

  final HomeCloudFirestoreRepository _cloudRepo;

  bool _isMenuOpen = false;

  bool get isMenuOpen => _isMenuOpen;

  void toggleMenu([bool? newState]) {
    if (newState != null) {
      if (newState != _isMenuOpen) _isMenuOpen = newState;
    } else {
      _isMenuOpen = !_isMenuOpen;
    }
  }

  /// Update the views in the database just once per session
  /// TODO: Find a better way to call this function according to CA
  void updateViews() {
    if (kDebugMode) return;
    _cloudRepo.updateTotalViews();
  }

  /// Get the views for the app bar
  Future<int> getTotalViews() => _cloudRepo.getTotalViews();
}

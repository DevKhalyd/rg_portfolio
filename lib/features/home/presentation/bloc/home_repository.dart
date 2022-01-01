/// The logic for the HomeRepository
class HomeRepository {
  bool _isMenuOpen = false;

  bool get isMenuOpen => _isMenuOpen;

  toggleMenu([bool? newState]) {
    if (newState != null) {
      if (newState != _isMenuOpen) _isMenuOpen = newState;
    } else {
      _isMenuOpen = !_isMenuOpen;
    }
  }
}

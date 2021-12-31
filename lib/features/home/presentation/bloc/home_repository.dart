/// The logic for the HomeRepository
class HomeRepository {
  bool _isMenuOpen = false;

  bool get isMenuOpen => _isMenuOpen;

  toggleMenu() {
    _isMenuOpen = !_isMenuOpen;
  }

}

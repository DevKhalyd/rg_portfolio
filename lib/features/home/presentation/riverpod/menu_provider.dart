import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_provider.g.dart';

/// Enum that represents the state of the menu
///
/// [hide] - The menu is hidden
/// [socialMedia] - The menu is showing the social media links
/// [profile] - The menu is showing the profile links
enum MenuState { hide, socialMedia, profile }

@riverpod
class Menu extends _$Menu {
  @override
  MenuState build() {
    return MenuState.hide;
  }

  void toggle(MenuState menuState) {
    assert(
      menuState != MenuState.hide,
      'You cannot toggle to hide. Valid states are socialMedia and profile',
    );
    state = menuState == state ? MenuState.hide : menuState;
  }

  void hide() {
    state = MenuState.hide;
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_search_provider.g.dart';

/// Enum that represents the state of the menu search
///
/// [hide] - The menu is hidden
/// [socialMedia] - The menu is showing the social media links
/// [profile] - The menu is showing the profile links
enum MenuSearchState { hide, socialMedia, profile }

@riverpod
class MenuSearch extends _$MenuSearch {
  @override
  MenuSearchState build() {
    return MenuSearchState.hide;
  }

  void toggle(MenuSearchState menuSearchState) {
    assert(
      menuSearchState != MenuSearchState.hide,
      'You cannot toggle to hide. Valid states are socialMedia and profile',
    );
    state = menuSearchState == state ? MenuSearchState.hide : menuSearchState;
  }

  void hide() {
    if (state == MenuSearchState.hide) {
      return;
    }
    state = MenuSearchState.hide;
  }
}

// NOTE: Why not use the MenuProvider for the search menu?

// The MenuProvider is used to manage the state of the menu in the home screen.
// The search menu is a different menu that is only shown in the search screen.
// At this time, both menus have the same behavior, but in the future, they may have different behaviors.
// And because there will be two menus in the whole website (home and search), it is better to have two providers to manage them separately.
// This way, if the behavior of one menu changes, it will not affect the other menu.
// But if the number of menu increases, create a shared feature to handle all of them with their respective providers.

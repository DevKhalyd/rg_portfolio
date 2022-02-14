import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../search/presentation/widgets/body/searcher_link_item.dart';
import '../../domain/usecases/searcher_item.dart';

final _searchItems = [
  // TODO: Add a section of social. Basically the same menu shown in the header of each screen.
  SearchItem(
    label: aboutMe,
    results: [
      SearchLinkItem(
        url: Utils.getUrlForOwnWebsite('aboutMe'),
        title: aboutMe,
        // Describe my self
        description: aboutMeDescription,
        onTap: () {
          SmartDialog.showToast(
            '',
            widget: const CustomToast('A short description about myself'),
          );
        },
      ),
      SearchLinkItem(
        url: Utils.getUrlForGithub('DevKhalyd'),
        title: 'GitHub Profile',
        description: 'My GitHub Profile where code is hosted',
        onTap: () => Utils.launchURL(Utils.getUrlForGithub('DevKhalyd')),
      ),
    ],
  ),
  SearchItem(
    label: 'Projects',
    results: [
      SearchLinkItem(
        url: Utils.getUrlForGithub('DevKhalyd/rgProjects'),
        title: 'RG Projects',
        description: 'Fancy Designs made with Flutter',
        onTap: () =>
            Utils.launchURL(Utils.getUrlForGithub('DevKhalyd/rgProjects')),
      ),
      // GitHub Portfolio
      SearchLinkItem(
        url: Utils.getUrlForGithub('DevKhalyd/rg_portfolio'),
        title: 'Portfolio',
        description: 'My Portfolio source code',
        onTap: () =>
            Utils.launchURL(Utils.getUrlForGithub('DevKhalyd/rg_portfolio')),
      ),
    ],
  ),
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

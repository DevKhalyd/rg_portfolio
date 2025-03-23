import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../../search/presentation/widgets/body/searcher_link_item.dart';
import '../../../domain/usecases/searcher_item.dart';

final _searchItems = [
  SearchItem(
    label: aboutMe,
    results: [
      SearchLinkItem(
        url: Utils.getUrlForOwnWebsite('aboutMe'),
        title: aboutMe,
        // Describe my self
        description: aboutMeDescription,
        onTap: (_) => SmartDialog.showToast('',
            maskWidget: const CustomToast('A short description about myself')),
      ),
      SearchLinkItem(
        url: Utils.getUrlForGithub('DevKhalyd'),
        title: 'GitHub Profile',
        description: 'My GitHub Profile where code is hosted',
        onTap: (_) => Utils.launchURL(Utils.getUrlForGithub('DevKhalyd')),
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
        onTap: (_) =>
            Utils.launchURL(Utils.getUrlForGithub('DevKhalyd/rgProjects')),
      ),
      // GitHub Portfolio
      SearchLinkItem(
        url: Utils.getUrlForGithub('DevKhalyd/rg_portfolio'),
        title: 'Portfolio',
        description: 'My Portfolio source code',
        onTap: (_) =>
            Utils.launchURL(Utils.getUrlForGithub('DevKhalyd/rg_portfolio')),
      ),
    ],
  ),
  SearchItem(
    label: 'Social',
    results: [
      SearchLinkItem(
        url: Utils.linkedInUrl,
        title: 'LinkedIn',
        description: 'My LinkedIn Profile',
        onTap: (_) => Utils.launchURL(Utils.linkedInUrl),
      ),
      SearchLinkItem(
        url: Utils.githubUrl,
        title: 'GitHub',
        description: 'My GitHub Profile',
        onTap: (_) => Utils.launchURL(Utils.githubUrl),
      ),
      SearchLinkItem(
        url: Utils.githubUrl,
        title: 'StackOverlow',
        description: 'My StackOverflow Profile',
        onTap: (_) => Utils.launchURL(Utils.stackOverflowUrl),
      ),
    ],
  ),
];

/// Just wraps the results for my home screen
List<SearchItem> getSearchItems() => _searchItems;

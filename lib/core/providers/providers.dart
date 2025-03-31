import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/core/router/routes.dart';
import 'package:rg_portfolio/core/utils/utils.dart';
import 'package:rg_portfolio/features/home/domain/usecases/searcher_item.dart';
import 'package:rg_portfolio/features/search/presentation/widgets/body/searcher_link_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

// NOTE: This list items could be moved to a mixin to provide the same list to different
// screens instead in a provider, but how can I maintain the state of the list?

final _searchItems = <SearchItem>[
  SearchItem(
    label: aboutMe,
    results: [
      SearchLinkItem(
        url: Utils.getUrlForOwnWebsite('aboutMe'),
        title: aboutMe,
        description: aboutMeDescription,
        onTap: null,
      ),
      SearchLinkItem(
        url: Utils.getUrlForGithub('DevKhalyd'),
        title: 'GitHub Profile',
        description: 'My GitHub Profile where code is hosted',
        onTap: () => Utils.launchURL(Utils.getUrlForGithub()),
      ),
    ],
  ),
  SearchItem(
    label: 'Projects',
    results: [
      SearchLinkItem(
        url: Utils.getUrlForGithub('rgProjects'),
        title: 'RG Projects',
        description: 'Fancy Designs made with Flutter',
        onTap: () => Utils.launchURL(Utils.getUrlForGithub('rgProjects')),
      ),
      // GitHub Portfolio
      SearchLinkItem(
        url: Utils.getUrlForGithub('rg_portfolio'),
        title: 'Portfolio',
        description: 'My Portfolio source code',
        onTap: () => Utils.launchURL(Utils.getUrlForGithub('rg_portfolio')),
      ),
      // Tic Tac Toe Project
      SearchLinkItem(
        url: Utils.getUrlForOwnWebsite(ticTacToeRoute),
        title: 'Tic Tac Toe',
        topicList: ['Flutter', 'Game'],
        description: 'A simple Tic Tac Toe game made with Flutter',
        onNavigation: ticTacToeRoute,
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
        onTap: () => Utils.launchURL(Utils.linkedInUrl),
      ),
      SearchLinkItem(
        url: Utils.githubUrl,
        title: 'GitHub',
        description: 'My GitHub Profile',
        onTap: () => Utils.launchURL(Utils.githubUrl),
      ),
      SearchLinkItem(
        url: Utils.githubUrl,
        title: 'StackOverlow',
        description: 'My StackOverflow Profile',
        onTap: () => Utils.launchURL(Utils.stackOverflowUrl),
      ),
    ],
  ),
];

/// A provider that returns a list of searchable items for the website
@riverpod
List<SearchItem> searchableItems(Ref ref) {
  return _searchItems;
}

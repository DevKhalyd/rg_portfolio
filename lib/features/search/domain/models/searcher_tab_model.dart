import 'package:flutter/material.dart';

import '../../presentation/screen/fragments/search_all_fragment.dart';
import '../../presentation/screen/fragments/search_images_fragment.dart';
import '../../presentation/screen/fragments/search_news_fragment.dart';

/// Model to use as parameter in [SearcherTab]
class SearcherTabModel {
  const SearcherTabModel({
    required this.label,
    required this.icon,
    required this.fragment,
  });

  /// Label should be different between tabs
  final String label;
  final IconData icon;

  /// The widget to show when the tab is selected
  final Widget fragment;

  // Create the copyWith
  SearcherTabModel copyWith({String? label, IconData? icon, bool? isSelected}) {
    return SearcherTabModel(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      fragment: fragment,
    );
  }

  /// Tabs to show in the [SearchScreen]
  static List<SearcherTabModel> getTabs() {
    return const [
      SearcherTabModel(
        label: 'All',
        icon: Icons.search,
        fragment: SearchAllFragment(),
      ),
      SearcherTabModel(
        label: 'Images',
        icon: Icons.image,
        fragment: SearchImagesFragment(),
      ),
      SearcherTabModel(
        label: 'News',
        icon: Icons.new_releases,
        fragment: SearchNewsFragment(),
      ),
    ];
  }
}

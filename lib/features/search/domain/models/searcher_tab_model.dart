import 'package:flutter/material.dart';

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
  SearcherTabModel copyWith({
    String? label,
    IconData? icon,
    bool? isSelected,
  }) {
    return SearcherTabModel(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      fragment: fragment,
    );
  }

  /// Tabs to show in the [HomeScreen]
  static List<SearcherTabModel> getTabs() {
    return [
      SearcherTabModel(
        label: 'All',
        icon: Icons.search,
        fragment: Container(
          color: Colors.red,
        ),
      ),
      SearcherTabModel(
        label: 'Images',
        icon: Icons.image,
        fragment: Container(
          color: Colors.green,
        ),
      ),
      SearcherTabModel(
        label: 'News',
        icon: Icons.new_releases,
        fragment: Container(
          color: Colors.yellow,
        ),
      ),
    ];
  }
}

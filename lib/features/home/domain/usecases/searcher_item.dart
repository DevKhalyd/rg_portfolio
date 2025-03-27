import '../../../search/presentation/widgets/body/searcher_link_item.dart';

const aboutMe = 'About Me';

const aboutMeDescription =
    "I am a software developer, I have been working in the field of software development for the last few years. I am a self-taught programmer and I am always looking for new challenges and new ways to improve myself.";

/// A class that allows to create a list of results for the [SearcherScreen]
class SearchItem {
  SearchItem({
    required this.label,
    required this.results,
    this.wasSelected = false,
  }) : assert(results.isNotEmpty);

  final String label;

  /// A list of result given the [label]
  final List<SearchLinkItem> results;

  /// True if this item was selected previously by the user.
  /// 
  /// Allow to color the item differently.
  bool wasSelected;

  @override
  String toString() {
    return label;
  }
}

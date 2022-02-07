import '../../../search/presentation/widgets/body/searcher_link_item.dart';

class SearchItem {
  static const aboutMe = 'About Me';

  static const aboutMeDescription =
      """I am a software developer, I have been working in 
  the field of software development for the last few years. I am a self-taught 
  programmer and I am always looking for new challenges and new ways to improve 
  myself.""";

  SearchItem({
    required this.label,
    required this.results,
    this.wasSelected = false,
  }) : assert(results.isNotEmpty);

  final String label;

  /// The result to show in the screen
  final List<SearchLinkItem> results;

  /// If this item was selected previously by the user.
  bool wasSelected;

  @override
  String toString() {
    return label;
  }
}

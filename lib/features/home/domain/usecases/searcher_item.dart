class SearchItem {
  SearchItem({
    required this.label,
    this.wasSelected = false,
  });

  final String label;

  /// If this item was selected by the user.
  bool wasSelected;

  @override
  String toString() {
    return label;
  }
}

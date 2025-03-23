import 'package:flutter/material.dart';

import '../../../../../../core/widgets/widgets.dart';
import 'searcher_icon_tab.dart';

// Ref: https://stackoverflow.com/questions/52982113/how-to-give-gradient-for-bottom-navigation-bar-icons-in-flutter

/// The tab used in the search screen
class SearcherTab extends StatelessWidget {
  const SearcherTab({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    this.onPressed,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearcherContentTab(
          icon: icon,
          isSelected: isSelected,
          label: label,
          onPressed: onPressed,
        ),
        const SizedBox(height: 3.5),
        Container(
          color: isSelected ? Colors.blueAccent : Colors.grey,
          height: isSelected ? 3 : .5,
          width: 130,
        ),
      ],
    );
  }
}

class SearcherContentTab extends StatefulWidget {
  const SearcherContentTab({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final bool isSelected;
  final String label;
  final VoidCallback? onPressed;

  @override
  State<SearcherContentTab> createState() => _SearcherContentTabState();
}

class _SearcherContentTabState extends State<SearcherContentTab> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: MouseRegion(
        onEnter: (_) => setState(() => onHover = true),
        onExit: (_) => setState(() => onHover = false),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearcherIconTab(
              icon: widget.icon,
              isSelected: widget.isSelected,
              onHover: onHover,
            ),
            const SizedBox(width: 10),
            TextCustom(
              widget.label,
              color: widget.isSelected || onHover
                  ? Colors.blueAccent
                  : Colors.grey,
              fontSize: 19,
            ),
          ],
        ),
      ),
    );
  }
}

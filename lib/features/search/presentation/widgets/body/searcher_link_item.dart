import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/text_custom.dart';
import '../../mixins/searcher_mixin.dart';

// TODO: Add the link widget to my website

/// The item that appears when a result is selected.
class SearchLinkItem extends StatefulWidget {
  const SearchLinkItem({
    super.key,
    required this.url,
    required this.title,
    required this.description,
    this.onTap,
    this.onNavigation,
    this.topicList,
    this.wasSelected = false,
  }) : assert((topicList?.length ?? 0) < 3);

  /// Url to be shown above of the searchable item
  final String url;

  /// The list of topics to be shown in the item
  final List<String>? topicList;

  /// The title of the item
  final String title;

  /// The description of the item
  final String description;

  /// The function to be called when the item is clicked
  final VoidCallback? onTap;

  /// Route to be navigated to when the item is clicked
  final String? onNavigation;

  /// When this item was selected by the user. Change the color if true or false
  final bool wasSelected;

  @override
  State<SearchLinkItem> createState() => _SearchLinkItemState();
}

class _SearchLinkItemState extends State<SearchLinkItem> with SearcherMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isEnoughSpace(context) ? 0 : side,
        right: side,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkResponse(
            radius: 0,
            onTap: onTap,
            onHover: (value) {
              setState(() {
                isHover = value;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: isEnoughSpace(context) ? null : 450,
                  child: TextCustom(
                    widget.url,
                    color: Colors.black,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (widget.topicList != null) const SizedBox(width: 2),
                if (widget.topicList != null) ...getTopics(),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          // Add the underline text
          InkResponse(
            radius: 0,
            onTap: onTap,
            onHover: (value) => setState(() => isHover = value),
            child: TextCustom(
              widget.title,
              color: widget.wasSelected ? Colors.deepPurple : Colors.deepPurple,
              fontSize: 25,
              decoration:
                  isHover ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: SelectableText(
              widget.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 20,
                height: 1.4,
                color: Colors.black87,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates if the [onNavigation] is not null
  ///
  /// Otherwise calls the [widget.onTap] function if it is not null
  void onTap() {
    if (widget.onNavigation != null) {
      context.go(widget.onNavigation!);
      return;
    }
    widget.onTap?.call();
  }

  List<Widget> getTopics() {
    final widgets = <Widget>[];

    final topics = widget.topicList!;

    for (final t in topics) {
      widgets.add(const SizedBox(width: 6.0));
      widgets.add(
        const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 12),
      );
      widgets.add(const SizedBox(width: 6.0));
      widgets.add(TextCustom(t, color: Colors.grey, fontSize: 20));
    }
    return widgets;
  }
}

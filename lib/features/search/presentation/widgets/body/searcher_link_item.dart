import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_custom.dart';
import '../../mixins/searcher_mixin.dart';

typedef VoidContextCallBack = void Function(BuildContext);

/// The item that appears when a result is selected.
class SearchLinkItem extends StatefulWidget {
  const SearchLinkItem({
    super.key,
    required this.url,
    required this.title,
    required this.description,
    required this.onTap,
    this.topicList,
    this.wasSelected = false,
  });

  /// The URL of the link
  final String url;
  final List<String>? topicList;

  /// Make the title clickable (Selectable word is the widget key)
  final String title;
  final String description;

  /// When the link is pressed
  final VoidContextCallBack? onTap;

  /// When this item was selected by the user. Change the color if true or false
  final bool wasSelected;

  @override
  State<SearchLinkItem> createState() => _SearchLinkItemState();
}

class _SearchLinkItemState extends State<SearchLinkItem> with SearcherMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    assert((widget.topicList?.length ?? 0) < 3);

    return Padding(
      // Validate the left part
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
            onTap: () {
              widget.onTap?.call(context);
            },
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
                if (widget.topicList != null) ...getTopics()
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          // Add the underline text
          InkResponse(
            radius: 0,
            onTap: () {
              widget.onTap?.call(context);
            },
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
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
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

  List<Widget> getTopics() {
    final widgets = <Widget>[];

    final topics = widget.topicList!;

    for (final t in topics) {
      widgets.add(const SizedBox(width: 6.0));
      widgets.add(
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 12,
        ),
      );
      widgets.add(const SizedBox(width: 6.0));
      widgets.add(
        TextCustom(
          t,
          color: Colors.grey,
          fontSize: 20,
        ),
      );
    }
    return widgets;
  }
}

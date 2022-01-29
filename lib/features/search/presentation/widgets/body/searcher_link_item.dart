import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_custom.dart';


// TODO: Continue replicating this part: 

// https://gfolio.enjeck.com/about

/// The item that appears when a result is selected.
class SearchLinkItem extends StatefulWidget {
  const SearchLinkItem({
    Key? key,
    required this.url,
    required this.title,
    required this.description,
    required this.onTap,
    this.topicList,
    this.wasSelected = false,
  }) : super(key: key);

  final String url;
  final List<String>? topicList;

  /// Make the title clickable (Selectable word is the widget key)
  final String title;
  final String description;

  /// When the link is pressed
  final VoidCallback? onTap;

  /// When this item was selected by the user. Change the color if true or false
  final bool wasSelected;

  @override
  State<SearchLinkItem> createState() => _SearchLinkItemState();
}

class _SearchLinkItemState extends State<SearchLinkItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    assert((widget.topicList?.length ?? 0) < 3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkResponse(
          radius: 0,
          onTap: widget.onTap,
          onHover: (value) {
            setState(() {
              isHover = value;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextCustom(
                widget.url,
                color: Colors.grey,
                fontSize: 18,
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
          onTap: widget.onTap,
          onHover: (value) => setState(() => isHover = value),
          child: TextCustom(
            widget.title,
            color: widget.wasSelected ? Colors.deepPurple : Colors.blue,
            fontSize: 25,
            decoration:
                isHover ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
        const SizedBox(height: 15.0),
        SelectableText(
          widget.description,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ],
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

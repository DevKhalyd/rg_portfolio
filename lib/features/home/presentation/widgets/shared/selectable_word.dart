import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/extensions/build_context_ext.dart';

/// When the users hovers an element, the element show a line under the text,
/// then if is pressed do an action.
class SelectableWord extends StatefulWidget {
  const SelectableWord({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;

  @override
  State<SelectableWord> createState() => _SelectableWordState();
}

class _SelectableWordState extends State<SelectableWord> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    /// Use state because the logic is too simple.
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.getPercentWidth(0.005)),
      child: MouseRegion(
        onExit: (event) => setState(() => isHover = false),
        onEnter: (event) => setState(() => isHover = true),
        child: InkResponse(
          onTap: widget.onPressed,
          hoverColor: Colors.transparent,
          child: Text(
            widget.label,
            style: TextStyle(
              decoration: isHover ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}

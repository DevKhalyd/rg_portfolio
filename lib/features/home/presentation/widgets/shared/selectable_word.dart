import 'package:flutter/material.dart';

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
    return MouseRegion(
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
    );
  }
}

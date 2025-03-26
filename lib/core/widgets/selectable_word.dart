import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';
import 'text_custom.dart';

/// A basic pressable text widget.
class SelectableWord extends StatefulWidget {
  const SelectableWord({
    super.key,
    required this.onPressed,
    required this.label,
    this.fontSize,
    this.color,
  });

  final VoidCallback onPressed;
  final String label;
  final Color? color;
  final double? fontSize;

  @override
  State<SelectableWord> createState() => _SelectableWordState();
}

class _SelectableWordState extends State<SelectableWord> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    /// Use state because the logic is too simple.
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getPercentWidth(0.005)),
      child: MouseRegion(
        onExit: (_) => setState(() => isHover = false),
        onEnter: (_) => setState(() => isHover = true),
        child: InkResponse(
          onTap: widget.onPressed,
          hoverColor: Colors.transparent,
          child: TextCustom(
            widget.label,
            color: widget.color,
            fontSize: widget.fontSize,
            decoration:
                isHover ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

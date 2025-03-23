import 'package:flutter/material.dart';

import '../extensions/build_context_ext.dart';

// Ref: https://pub.dev/packages/flutter_smart_dialog#custom-toast

class CustomToast extends StatelessWidget {
  const CustomToast(
    this.msg, {
    super.key,
    this.alignment,
    this.margin,
  });

  final String msg;

  final AlignmentGeometry? alignment;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    //Alignment.bottomRight

    final isMobileSize = context.isMobileSize;

    final defaultAligment =
        isMobileSize ? Alignment.bottomCenter : Alignment.bottomRight;

    final defaultMargin = isMobileSize
        ? EdgeInsets.only(bottom: context.getPercentHeight(0.01))
        : EdgeInsets.only(bottom: context.getPercentHeight(0.12), right: 30);

    return Align(
      alignment: alignment ?? defaultAligment,
      child: Container(
        margin: margin ?? defaultMargin,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          //icon
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            padding: const EdgeInsets.all(4.0),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 20),
          Text(msg,
              style: const TextStyle(
                color: Colors.white,
              )),
          const SizedBox(width: 20),
        ]),
      ),
    );
  }
}

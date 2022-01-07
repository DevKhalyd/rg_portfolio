import 'package:flutter/material.dart';
import 'package:rg_portfolio/core/extensions/build_context_ext.dart';

// Ref: https://pub.dev/packages/flutter_smart_dialog#custom-toast

class CustomToast extends StatelessWidget {
  const CustomToast(this.msg, {Key? key}) : super(key: key);

  final String msg;
  // TODO: Ask for the margin and the aligment for other dimensions

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin:
            EdgeInsets.only(bottom: context.getPercentHeight(0.12), right: 30),
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

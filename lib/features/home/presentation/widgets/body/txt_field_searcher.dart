import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_ext.dart';

const _cornerValue = 24.0;

final _borderRadius = BorderRadius.circular(_cornerValue);

const _constraints = BoxConstraints(
  maxWidth: 900,
  minWidth: 400,
);

const List<String> _options = <String>[
  'About me',
  'Projects',
  'Hello World',
];

/// The text field when the user search for the new things about me
class TextFieldSearcher extends StatefulWidget {
  const TextFieldSearcher({Key? key}) : super(key: key);

  @override
  State<TextFieldSearcher> createState() => _TextFieldSearcherState();
}

class _TextFieldSearcherState extends State<TextFieldSearcher> {
  final controller = TextEditingController();
  // NOTE: Verify if this one is important
  final focusNode = FocusNode();

  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      final focus = focusNode.hasFocus;
      if (focus != isFocused) {
        setState(() => isFocused = focus);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Textfield width
    final width = context.width * 0.35;

    return RawAutocomplete<String>(
        textEditingController: controller,
        focusNode: focusNode,
        fieldViewBuilder: (_, controller, focusNode, onSubmitted) {
          return Container(
            constraints: _constraints,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: Colors.white,
            ),
            width: width,
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hoverColor: Colors.red,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: _borderRadius,
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 10.0,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(_cornerValue),
                    topRight: Radius.circular(_cornerValue),
                  ),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          );
        },
        optionsBuilder: (textEditingValue) => _options,
        optionsViewBuilder: (context, onSelected, options) {
          const sharedBorderRadius = BorderRadius.only(
            bottomLeft: Radius.circular(_cornerValue),
            bottomRight: Radius.circular(_cornerValue),
          );

          return Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 250,
              width: width,
              constraints: _constraints,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: sharedBorderRadius),
              child: Material(
                borderRadius: sharedBorderRadius,
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    // TODO: Make it blue to see if the user already view this item
                    return ListTile(
                      hoverColor: Colors.grey.shade300,
                      leading: const Icon(Icons.history),
                      onTap: () => onSelected(option),
                      title: Text(option),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/core/providers/providers.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/widgets/text_custom.dart';
import '../../../domain/usecases/searcher_item.dart';

const _cornerValue = 24.0;

final _borderRadius = BorderRadius.circular(_cornerValue);

const _constraints = BoxConstraints(maxWidth: 900, minWidth: 400);

class TextFieldSearcher extends ConsumerStatefulWidget {
  const TextFieldSearcher({super.key, this.onSelected, this.initialValue = ''});

  final void Function(SearchItem)? onSelected;
  final String initialValue;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextFiieldSearcherState();
}

class _TextFiieldSearcherState extends ConsumerState<TextFieldSearcher> {
  // Need for a correct working of the text field
  final focusNode = FocusNode();
  final controller = TextEditingController();

  void Function(SearchItem)? onSelected;

  @override
  void initState() {
    super.initState();
    onSelected = widget.onSelected;
    controller.text = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    /// Textfield width
    final width = context.width * 0.35;

    final isMobileSize = context.isMobileSize;

    return RawAutocomplete<SearchItem>(
      textEditingController: controller,
      focusNode: focusNode,
      onSelected: (item) {
        // context.read<HomeBloc>().add(HomeSelectedSearch(item: item)); // Triggers HomeSearch event
        if (onSelected != null) onSelected!(item);
      },
      fieldViewBuilder: (_, controller, focusNode, onSubmitted) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobileSize ? 15 : 0),
          child: Container(
            constraints: _constraints,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: Colors.white,
            ),
            width: width,
            child: TextFormField(
              onTap: () => controller.clear(),
              controller: controller,
              focusNode: focusNode,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hoverColor: Colors.red,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: _borderRadius,
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 10.0,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(_cornerValue),
                    topRight: Radius.circular(_cornerValue),
                  ),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
          ),
        );
      },
      // The options to show in the screen
      optionsBuilder: (textEditingValue) => ref.read(searchableItemsProvider),
      optionsViewBuilder: (_, onSelected, options) {
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
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: sharedBorderRadius,
            ),
            child: Material(
              borderRadius: sharedBorderRadius,
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  return ListTile(
                    hoverColor: Colors.grey.shade300,
                    leading: const Icon(Icons.history),
                    onTap: () {
                      onSelected(option);
                    },
                    title: TextCustom(
                      option.label,
                      color:
                          option.wasSelected ? Colors.deepPurple : Colors.black,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }
}

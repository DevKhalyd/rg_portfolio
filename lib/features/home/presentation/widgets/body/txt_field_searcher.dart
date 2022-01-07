import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../../core/widgets/text_custom.dart';
import '../../../domain/usecases/searcher_item.dart';
import '../../bloc/home_bloc.dart';

const _cornerValue = 24.0;

final _borderRadius = BorderRadius.circular(_cornerValue);

const _constraints = BoxConstraints(
  maxWidth: 900,
  minWidth: 400,
);

/// The text field when the user search for the new things about me
class TextFieldSearcher extends StatefulWidget {
  const TextFieldSearcher({Key? key}) : super(key: key);

  @override
  State<TextFieldSearcher> createState() => _TextFieldSearcherState();
}

class _TextFieldSearcherState extends State<TextFieldSearcher> {
  // Need for a correct working of the text field
  final focusNode = FocusNode();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// Textfield width
    final width = context.width * 0.35;

    final homeRepository = context.read<HomeBloc>().homeRepository;

    return RawAutocomplete<SearchItem>(
        textEditingController: controller,
        focusNode: focusNode,
        onSelected: (option) {
          // NOTE: Do something with this
          log('Selected: $option');
        },
        fieldViewBuilder: (_, controller, focusNode, onSubmitted) {
          return Container(
            constraints: _constraints,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: Colors.white,
            ),
            width: width,
            child: TextFormField(
              onTap: () {
                context.read<HomeBloc>().add(HomeInitial());
                controller.clear();
              },
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
        optionsBuilder: (textEditingValue) => homeRepository.searchItems,
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
                    return ListTile(
                      hoverColor: Colors.grey.shade300,
                      leading: const Icon(Icons.history),
                      onTap: () {
                        homeRepository.changeSearchItem(option);
                        onSelected(option);
                      },
                      title: TextCustom(
                        option.label,
                        color: option.wasSelected
                            ? Colors.deepPurple
                            : Colors.black,
                      ),
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

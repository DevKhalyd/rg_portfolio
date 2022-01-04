import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rg_portfolio/features/home/presentation/widgets/body/search_button.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../bloc/home_bloc.dart';
import '../shared/rg_name.dart';
import 'txt_field_searcher.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 8,
        child: Stack(
          children: [
            // TODO: If the size is too small add a scroll views
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RGName(),
                  const SizedBox(height: 30),
                  const TextFieldSearcher(),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SearchButton(
                        "Search Website",
                        onPressed: () {},
                      ),
                      const SizedBox(width: 30),
                      SearchButton(
                        "I'm feeling lucky",
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
              if (state is HomeToggleMenu) {
                return state.isOpen
                    ? Positioned(
                        top: context.getPercentHeight(0.0005),
                        right: context.getPercentWidth(0.015),
                        child: state.menu,
                      )
                    : const SizedBox();
              }

              return const SizedBox();
            }),
          ],
        ));
  }
}

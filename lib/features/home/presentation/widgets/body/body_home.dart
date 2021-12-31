import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/widgets.dart';
import '../../bloc/home_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 6,
        child: Stack(
          children: [
            // The Rolando name with Google Font and the field to search for
            Column(
              children: const [
                TextCenter('Some text for interviewing'),
              ],
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
              if (state is HomeToggleMenu) {
                return state.isOpen
                    ? Positioned(
                        top: context.getPercentHeight(0.0005),
                        right: context.getPercentWidth(0.001),
                        child: Container(
                          color: Colors.red,
                          height: 300,
                          width: 300,
                        ),
                      )
                    : const SizedBox();
              }

              return const SizedBox();
            }),
          ],
        ));
    /*
          if (state is HomeToggleMenu)
                state.isOpen
                    ? Positioned(
                        top: context.getPercentHeight(0.0005),
                        right: context.getPercentWidth(0.001),
                        child: Container(
                          color: Colors.red,
                          height: 300,
                          width: 300,
                        ),
                      )
                    : const SizedBox(),

           */

    /*
   */
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';

class BodySearcher extends StatelessWidget {
  const BodySearcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
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
      ),
    );
  }
}

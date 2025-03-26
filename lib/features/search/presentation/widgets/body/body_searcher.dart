import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';
import '../../../domain/models/searcher_tab_model.dart';
import '../../mixins/searcher_mixin.dart';
import 'searcher_tabs/searcher_tabs.dart';

// IMPORTANT: THE HOME BLOCK DOES NOT SHULD BE USED HERE SINCE IT IS A FEATURE
// THAT IS NOT RELATED TO THE SEARCH FEATURE

class BodySearcher extends StatelessWidget with SearcherMixin {
  const BodySearcher({super.key});

  @override
  Widget build(BuildContext context) {
    final flex = context.isMobileSize ? 7 : 8;

    return Expanded(
      flex: flex,
      child: isEnoughSpace(context)
          ? Stack(
              children: [
                GestureDetector(
                  onTap: () => context.read<HomeBloc>().add(HomeInitial()),
                  child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const SizedBox(width: rightSpace + 100),
                          Expanded(
                            child:
                                SearcherTabs(tabs: SearcherTabModel.getTabs()),
                          )
                        ],
                      )),
                ),

                /// Menu
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
            )
          : SearcherTabs(tabs: SearcherTabModel.getTabs()),
    );
  }
}

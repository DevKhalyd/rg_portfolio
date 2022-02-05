import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_ext.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';
import 'searcher_link_item.dart';

class BodySearcher extends StatelessWidget {
  const BodySearcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flex = context.isMobileSize ? 7 : 8;

    final width = context.width;

    return Expanded(
      flex: flex,
      child: width > minWidthSearch
          ? Stack(
              children: [
                GestureDetector(
                  onTap: () => context.read<HomeBloc>().add(HomeInitial()),
                  child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Row(
                        children: const [
                          SizedBox(width: rightSpace + 100),
                          Expanded(
                            child: ResultsSearch(),
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
          : const ResultsSearch(),
    );
  }
}


// TODO: Start to listen to this place
/// The results of the search
class ResultsSearch extends StatelessWidget {
  const ResultsSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 40),
        SearchLinkItem(
          onTap: () {},
          url: 'www.example.com',
          title: 'Example',
          topicList: const ['Example', 'Example'],
          description: 'Description of the example. Add a long description.',
        ),
        SearchLinkItem(
          onTap: () {},
          url: 'www.example.com',
          title: 'Example',
          description: 'Description of the example. Add a long description.',
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rg_portfolio/core/extensions/build_context_ext.dart';

import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../utils/utils.dart';

const _size = 150.0;

const _sizemobile = 100.0;

class IconOption extends StatelessWidget {
  const IconOption({
    super.key,
    required this.asset,
    required this.label,
    this.url,
    this.onPressed,
  });

  final String asset;
  final String label;

  /// The url has priority over the onPressed
  final String? url;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isMobileSize = context.isMobileSize;

    final size = isMobileSize ? _sizemobile : _size;

    final heightSizedBox = isMobileSize ? 10.0 : 20.0;

    final fontSize = isMobileSize ? 15.0 : 18.0;

    return InkResponse(
      radius: size / 2.1,
      onTap: () => onTap(context),
      child: SizedBox(
        height: size,
        width: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              height: size * .5,
            ),
            SizedBox(height: heightSizedBox),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    final isMobile = context.isMobileSize;
    if (isMobile) {
      Navigator.pop(context);
    } else {
      context.read<HomeBloc>().add(HomeInitial());
    }
    final onDefault = url != null ? () => Utils.launchURL(url!) : onPressed;
    onDefault!();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../utils/utils.dart';

const _size = 150.0;

class IconOption extends StatelessWidget {
  const IconOption({
    Key? key,
    required this.asset,
    required this.label,
    this.url,
    this.onPressed,
  })  : assert(url == null || onPressed == null,
            'At least one of url or onPressed must be null'),
        super(key: key);

  final String asset;
  final String label;

  /// The url has priority over the onPressed
  final String? url;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      radius: _size / 2.1,
      onTap: () => onTap(context),
      child: SizedBox(
        height: _size,
        width: _size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              height: _size * .5,
            ),
            const SizedBox(height: 20),
            Text(
              label,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    final onDefault = url != null ? () => Utils.launchURL(url!) : onPressed;
    onDefault!();
    context.read<HomeBloc>().add(HomeInitial());
  }
}

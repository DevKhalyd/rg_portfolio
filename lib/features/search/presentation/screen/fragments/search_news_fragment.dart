import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_custom.dart';

class SearchNewsFragment extends StatelessWidget {
  const SearchNewsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          // Icon news
          Icons.new_releases,
          size: 120,
          color: Colors.grey,
        ),
        SizedBox(height: 16),
        TextCustom(
          '"Nothing new to show here"',
          fontSize: 24,
        )
      ],
    );
  }
}

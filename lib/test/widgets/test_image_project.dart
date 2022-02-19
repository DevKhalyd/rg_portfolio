import 'package:flutter/material.dart';

import '../../features/search/presentation/widgets/body/image_project.dart';

void main() => runApp(const TestImageProject());

class TestImageProject extends StatelessWidget {
  const TestImageProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Project'),
        ),
        body: const Center(child: ImageProject.test()),
      ),
    );
  }
}

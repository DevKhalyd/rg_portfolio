import 'package:flutter/material.dart';
import '../extensions/build_context_ext.dart';
import '../routes.dart';
import '../utils/utils.dart';
import '../widgets/roland_image.dart';

/// Contains my personal info like name, email, phone number, etc.
class MenuProfile extends StatelessWidget {
  const MenuProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final width = (context.width / 2) * .47;

    return Container(
      constraints: const BoxConstraints(maxWidth: 410, minWidth: 400),
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 20, spreadRadius: 5),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const RolandoImage(minRadius: 30, maxRadius: 70),
            const SizedBox(height: 20),
            const Text(
              Utils.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const SelectableText(Utils.email, style: TextStyle(fontSize: 18)),
            const SizedBox(height: 25),
            const Divider(),
            InkResponse(
              onTap: () {
                if (context.getCurrentRouteName() == Routes.search) return;
                context.pushNamed(Routes.search);
              },
              highlightShape: BoxShape.rectangle,
              child: SizedBox(
                height: kToolbarHeight,
                width: double.infinity,
                child: Row(
                  children: const [
                    SizedBox(width: 30),
                    Icon(Icons.person_add_alt_1, color: Colors.grey),
                    SizedBox(width: 20),
                    Text('More about me'),
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                Utils.launchURL(Utils.githubUrl);
              },
              child: const Text('GitHub'),
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            InkResponse(
              highlightShape: BoxShape.rectangle,
              onTap: () => Utils.launchURL(Utils.websiteRepoUrl),
              child: const Text('View code'),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

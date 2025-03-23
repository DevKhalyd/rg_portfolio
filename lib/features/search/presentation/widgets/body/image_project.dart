import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../../core/widgets/widgets.dart';
import '../../mixins/searcher_mixin.dart';

/// A image project just show a preview of a project
///
/// Then if needed, contains a tap to go to another service or page
class ImageProject extends StatefulWidget with SearcherMixin {
  const ImageProject({
    super.key,
    required this.url,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.width = widthImageProject,
  });

  const ImageProject.test({
    super.key,
    this.url = 'https://gfolio.enjeck.com/static/media/gfolio.4b968882.png',
    this.title = 'Test title',
    this.subtitle = 'A basic description of this subtitle',
    this.onTap,
    this.width = widthImageProject,
  });

  final String url, title, subtitle;
  final double width;
  final VoidCallback? onTap;

  @override
  State<ImageProject> createState() => _ImageProjectState();
}

class _ImageProjectState extends State<ImageProject> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        boxShadow: [
          if (isHover)
            const BoxShadow(
              blurRadius: 5,
              spreadRadius: 0.5,
              color: Colors.grey,
            )
        ],
      ),
      child: InkResponse(
        onTap: widget.onTap,
        onHover: (value) {
          setState(() => isHover = value);
        },
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: _FadeImageCustom(
                  url: widget.url,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextCustom(
                  widget.title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextCustom(
                  widget.subtitle,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _FadeImageCustom extends StatelessWidget {
  const _FadeImageCustom({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Center(
            child: CircularProgressIndicator(
          strokeWidth: 2,
        )),
        Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: url,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}

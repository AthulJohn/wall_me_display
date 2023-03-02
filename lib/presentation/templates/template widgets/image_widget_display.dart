import 'package:flutter/material.dart';

import '../../../models/workshop/image_component_model.dart';

class ImageDisplay extends StatelessWidget {
  final ImageComponent? imageComponent;
  final double borderRadius;
  final int imageIndex;
  const ImageDisplay(
      {super.key,
      required this.imageIndex,
      this.imageComponent,
      this.borderRadius = 0});

  @override
  Widget build(BuildContext context) {
    return imageComponent == null
        ? Container()
        : ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              imageComponent!.url,
              fit: imageComponent!.fit,
              color: imageComponent!.overlayColor
                  .withOpacity(imageComponent!.overlayIntensity),
              colorBlendMode: BlendMode.hardLight,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return const Center(child: Text('Loading...'));
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                    child: Text('There was supposed to be an image here'));
              },
            ),
          );
  }
}

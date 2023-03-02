import 'package:flutter/material.dart';

import '../../../models/workshop/image_component_model.dart';

DecorationImage getDecorationImage(ImageComponent imageComponent) {
  return DecorationImage(
      image: NetworkImage(imageComponent.url),
      colorFilter: ColorFilter.mode(
          imageComponent.overlayColor
              .withOpacity(imageComponent.overlayIntensity),
          BlendMode.hardLight),
      fit: imageComponent.fit);
}

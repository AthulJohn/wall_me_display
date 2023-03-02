//Template 1 :- Column of Texts and an Image aligned horizontally

import 'package:flutter/material.dart';
import '../../constants/global_variables.dart';
import '../../global_functions.dart';

import '../../models/workshop/image_component_model.dart';
import '../../models/workshop/singlenote_model.dart';
import 'template widgets/decoration_image_component.dart';
import 'template widgets/image_widget_display.dart';
import 'template widgets/text_column_display.dart';

// Refer Template Varient Sheet for more details on how changes are done in the template
class ViewTemplate1 extends StatelessWidget {
  /// Requires 1 image and 1 text component
  /// 2nd image is optional to be background image :- future implementation
  final SingleNote note;
  const ViewTemplate1({super.key, required this.note});

  bool templateIsIn(int id, List<int> templateId) {
    /// Checks if the current template is in the list of templates
    return templateId.contains(id);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      ImageComponent? backgroundImage = note.imageComponents.length >
              (totalImagesPerTemplate[note.templateId] ?? 1)
          ? note.imageComponents[(totalImagesPerTemplate[note.templateId] ?? 1)]
          : null;
      return Container(
          color: Colors.white,
          child: Container(
            decoration: backgroundImage != null
                ? BoxDecoration(
                    color: backgroundImage.overlayColor
                        .withOpacity(backgroundImage.overlayIntensity),
                    image: backgroundImage.url != ''
                        ? getDecorationImage(backgroundImage)
                        : null,
                  )
                : null,
            padding: EdgeInsets.all(
                templateIsIn(note.templateId, [11, 12, 18, 17])
                    ? getRelativeHeight(20, constraints.maxWidth)
                    : 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: templateIsIn(note.templateId, [16, 18]) ? 3 : 1,
                  child: templateIsIn(note.templateId,
                          [11, 13, 16, 17]) // If image is in the left side
                      ? FractionallySizedBox(
                          widthFactor: templateIsIn(note.templateId, [11, 17])
                              ? 0.85
                              : 1,
                          heightFactor: templateIsIn(note.templateId, [11, 17])
                              ? 0.85
                              : 1,
                          child: ImageDisplay(
                            imageComponent: note.imageComponents.isEmpty
                                ? null
                                : note.imageComponents.first,
                            borderRadius:
                                templateIsIn(note.templateId, [11, 17])
                                    ? 10
                                    : 0,
                            imageIndex: 0,
                          ),
                        )
                      : note.textComponents.first.isEmpty
                          ? Container()
                          : TextColumnDisplay(
                              textComponents: note.textComponents.first,
                              templateId: note.templateId,
                            ),
                ),
                Expanded(
                  flex: templateIsIn(note.templateId, [15, 17]) ? 3 : 1,
                  child: templateIsIn(note.templateId,
                          [12, 14, 15, 18]) // If image is in the left side
                      ? FractionallySizedBox(
                          widthFactor: templateIsIn(note.templateId, [12, 18])
                              ? 0.85
                              : 1,
                          heightFactor: templateIsIn(note.templateId, [12, 18])
                              ? 0.85
                              : 1,
                          child: ImageDisplay(
                            imageComponent: note.imageComponents.isEmpty
                                ? null
                                : note.imageComponents.first,
                            borderRadius:
                                templateIsIn(note.templateId, [12, 18])
                                    ? 10
                                    : 0,
                            imageIndex: 0,
                          ),
                        )
                      : note.textComponents.first.isEmpty
                          ? Container()
                          : TextColumnDisplay(
                              textComponents: note.textComponents.first,
                              templateId: note.templateId,
                            ),
                ),
              ],
            ),
          ));
    });
  }
}

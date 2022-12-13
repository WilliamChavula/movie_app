import 'package:flutter/material.dart';
import '../common/common.dart';
import '../extensions/extensions.dart' show ThemeBrightness;

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    Key? key,
    required this.imageHeight,
    required this.imageWidth,
  }) : super(key: key);

  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: AppDimensions.mdX),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(AppDimensions.xsX)),
        child: Image.asset(
          context.isDarkMode
              ? ImageResource.placeholderImageDark
              : ImageResource.placeholderImageLight,
          height: imageHeight,
          width: imageWidth,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ImageIconWidget extends StatelessWidget {
  final double height;
  final double width;
  final String imageResource;
  final BoxFit fit;

  const ImageIconWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.imageResource,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageResource,
      fit: fit,
      width: width,
      height: height,
    );
  }
}

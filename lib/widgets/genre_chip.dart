import 'package:flutter/material.dart';

import '../common/common.dart';

class GenreChip extends StatelessWidget {
  final String genreName;

  const GenreChip({Key? key, required this.genreName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppDimensions.smX),
        child: Chip(label: Text(genreName)),
      ),
    );
  }
}

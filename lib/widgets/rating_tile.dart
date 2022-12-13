import 'package:flutter/material.dart';

import '../common/common.dart';

class RatingTile extends StatelessWidget {
  const RatingTile({Key? key, required this.rating}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.xsX),
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimensions.xsX),
        ),
      ),
      child: Text(
        'TMDB: $rating',
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: AppColors.bodyColorLight,
              fontWeight: FontWeight.bold,
              fontSize: AppDimensions.smallTextFontSize,
            ),
      ),
    );
  }
}

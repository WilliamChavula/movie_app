import 'package:flutter/material.dart';
import '../common/common.dart';
import 'image_icon.dart';

class MoviesListScreenAppBar extends StatelessWidget {
  const MoviesListScreenAppBar({Key? key}) : super(key: key);

  Row _brandBuilder({
    required String brandTitle,
    required Color color1,
    Color? color2,
    String? brandLogo,
  }) {
    return Row(
      children: [
        brandLogo != null
            ? ImageIconWidget(
                imageResource: brandLogo,
                width: AppDimensions.mdIconImageSizeX,
                height: AppDimensions.mdIconImageSizeY,
              )
            : Container(),
        SizedBox(width: AppDimensions.xsX),
        RichText(
          text: TextSpan(
            text: brandTitle.substring(0, 1),
            style: TextStyle(
              color: color1,
              fontWeight: FontWeight.bold,
              fontSize: AppDimensions.secondaryHeadingFontSize,
            ),
            children: [
              TextSpan(
                text: brandTitle.substring(1),
                style: TextStyle(
                  color: color2 ?? color1,
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimensions.secondaryHeadingFontSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImageIconWidget(
          imageResource: ImageResource.menuIcon,
          width: AppDimensions.iconImageSizeX,
          height: AppDimensions.iconImageSizeY,
        ),
        _brandBuilder(
          brandTitle: StringResource.appTitle,
          brandLogo: ImageResource.filmReelIcon,
          color1: AppColors.accentColor,
          color2: AppColors.primaryColor,
        ),
        ImageIconWidget(
          width: AppDimensions.iconImageSizeX,
          height: AppDimensions.iconImageSizeY,
          imageResource: ImageResource.notificationIcon,
        )
      ],
    );
  }
}

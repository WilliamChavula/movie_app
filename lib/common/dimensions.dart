import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppDimensions {
  const AppDimensions._();

  static final double bodyFontSize = 14.sp;
  static final double primaryHeadingFontSize = 34.sp;
  static final double secondaryHeadingFontSize = 22.sp;
  static final double subTitleFontSize = 16.sp;
  static final double buttonTextFontSize = 14.sp;
  static final double smallTextFontSize = 12.sp;
  static final double iconSize = 24.sp;

  static final double xsX = 4.w;
  static final double xsY = 4.h;
  static final double smX = 8.w;
  static final double smY = 8.h;
  static final double mdX = 12.w;
  static final double mdY = 12.h;
  static final double lgX1 = 16.w;
  static final double lgY1 = 16.h;
  static final double lgX2 = 20.w;
  static final double lgY2 = 20.h;
  static final double xLgX = 24.w;
  static final double xLgY = 24.h;
  static final double iconImageSizeX = 16.w;
  static final double iconImageSizeY = 16.h;
  static final double smIconImageSizeX = 12.w;
  static final double smIconImageSizeY = 12.h;
  static final double mdIconImageSizeX = 20.w;
  static final double mdIconImageSizeY = 20.h;
  static final double lgIconImageSizeX = 24.w;
  static final double lgIconImageSizeY = 24.h;
  static final double xlgIconImageSizeX = 36.w;
  static final double xlgIconImageSizeY = 36.h;
  static final double xxlgIconImageSizeX = 48.w;
  static final double xxlgIconImageSizeY = 48.h;
  static final double mdCarouselItemSizeX = 45.w;
  static final double mdCarouselItemSizeY = 80.h;

  static final double heroImageHeight = 310.h;
  static final double indicatorPositionX = 24.w;
  static final double indicatorPositionY = 40.h;
  static final double smContainerX = 40.w;
  static final double smContainerY = 40.h;
  static final double mdContainerY = 50.h;
  static final double chipHeight1 = 36.h;
  static final double movieCardHeight = 250.h;
  static final double movieCardWidth = 250.w;
  static final double mdCardWidth = 185.w;

  static final gradientStops = List<double>.unmodifiable([0.6, 1.0]);
  static const animationDuration = Duration(milliseconds: 250);
}

import 'package:flutter/material.dart';

import '../common/common.dart';

class CarouselIndicators extends StatefulWidget {
  final int carouselCollectionLength;
  final PageController pageController;
  final AnimationController animationController;

  const CarouselIndicators({
    Key? key,
    required this.carouselCollectionLength,
    required this.pageController,
    required this.animationController,
  }) : super(key: key);

  @override
  State<CarouselIndicators> createState() => _CarouselIndicatorsState();
}

class _CarouselIndicatorsState extends State<CarouselIndicators>
    with SingleTickerProviderStateMixin {
  late final Animation _expandedWidth;

  int _currentPage = 0;

  @override
  void initState() {
    _expandedWidth = Tween<double>(
      begin: AppDimensions.smX,
      end: AppDimensions.xLgX,
    ).animate(widget.animationController)
      ..addListener(() {
        setState(() {});
      });
    widget.pageController.addListener(() {
      setState(() {
        _currentPage = widget.pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.carouselCollectionLength,
        (index) => _currentPage == index
            ? Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.smX / 3,
                  vertical: AppDimensions.smY / 3,
                ),
                width: _expandedWidth.value == AppDimensions.smX
                    ? AppDimensions.xLgX
                    : _expandedWidth.value,
                height: AppDimensions.smX / 1.5,
                decoration: BoxDecoration(
                  color: AppColors.primaryColorAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.smX / 1.5),
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.smX / 3,
                  vertical: AppDimensions.smY / 3,
                ),
                width: AppDimensions.smX / 1.5,
                height: AppDimensions.smX / 1.5,
                decoration: BoxDecoration(
                  color: AppColors.primaryColorAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.smX / 1.5),
                  ),
                ),
              ),
      ),
    );
  }
}

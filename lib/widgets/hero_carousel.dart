import 'package:flutter/material.dart';

class HeroImageCarousel extends StatelessWidget {
  final List<String> images;
  final PageController pageController;
  final AnimationController animationController;

  const HeroImageCarousel({
    Key? key,
    required this.images,
    required this.pageController,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: images.length,
      itemBuilder: (context, index) => Image.asset(
        images[index],
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      onPageChanged: (currentPageIndex) {
        animationController.reverse();
        animationController.reset();
        animationController.forward();
      },
    );
  }
}

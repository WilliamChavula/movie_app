import 'package:flutter/material.dart';

import '../common/common.dart';
import '../widgets/widgets.dart';

class TabView extends StatelessWidget {
  final int length;

  const TabView({Key? key, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: AppDimensions.smContainerY,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.xsX,
                vertical: AppDimensions.xsY,
              ),
              decoration: BoxDecoration(
                color: AppColors.lightThemeSwatch[700]!,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.smX),
                ),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: AppColors.lightThemeSwatch[500]!,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.smX),
                  ),
                ),
                tabs: [
                  Tab(
                      child: Text(
                    StringResource.actorsTab,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: AppDimensions.smallTextFontSize),
                  )),
                  Tab(
                      child: Text(
                    StringResource.similarMovies,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: AppDimensions.smallTextFontSize),
                  )),
                ],
              ),
            ),
            Flexible(
              child: SizedBox(
                height: AppDimensions.movieCardHeight,
                child: TabBarView(
                  children: [
                    Actors(),
                    SimilarMovies(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

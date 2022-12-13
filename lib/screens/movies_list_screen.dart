import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screen_model_providers/movies_list_screen_model.dart';
import '../common/common.dart';
import '../extensions/extensions.dart' show ThemeBrightness;
import '../widgets/widgets.dart';

class MoviesListScreen extends ConsumerStatefulWidget {
  const MoviesListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends ConsumerState<MoviesListScreen>
    with SingleTickerProviderStateMixin {
  final MoviesListScreenModel _moviesListScreenModel = MoviesListScreenModel();
  late final AnimationController animationController;
  late final PageController pageController;

  final images = List<String>.unmodifiable([
    ImageResource.parasiteHeroImage,
    ImageResource.avatarHeroImage,
    ImageResource.blackAdamHeroImage,
    ImageResource.netflix1899HeroImage,
    ImageResource.topGunHeroImage,
    ImageResource.wakandaHeroImage,
  ]);

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    animationController = AnimationController(
      vsync: this,
      duration: AppDimensions.animationDuration,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final movieGenres = ref.watch(_moviesListScreenModel.movieGenres);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: AppDimensions.heroImageHeight,
                    foregroundDecoration: context.isDarkMode
                        ? AppColors.foregroundDecorationDark
                        : AppColors.foregroundDecorationLight,
                    child: HeroImageCarousel(
                      images: images,
                      pageController: pageController,
                      animationController: animationController,
                    ),
                  ),
                  Positioned(
                    bottom: AppDimensions.indicatorPositionY,
                    right: AppDimensions.indicatorPositionX,
                    child: CarouselIndicators(
                      carouselCollectionLength: images.length,
                      pageController: pageController,
                      animationController: animationController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: AppDimensions.xLgY,
                      left: AppDimensions.xLgX,
                      right: AppDimensions.xLgX,
                    ),
                    child: const MoviesListScreenAppBar(),
                  ),
                ],
              ),
              const SearchField(),
              SizedBox(height: AppDimensions.mdY),
              movieGenres.when(
                data: (genres) => GenreChipList(genres: genres),
                error: (_, __) => const DisplayError(
                  errorMessage: StringResource.fetchGenresError,
                ),
                loading: () => const LoadingIndicator(),
              ),
              SizedBox(height: AppDimensions.lgY1),
              Flexible(child: MoviesList()),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../common/common.dart';
import '../extensions/extensions.dart' show TimeFormat, ThemeBrightness;
import '../models/models.dart';
import '../screen_model_providers/movie_detail_screen_model.dart';
import '../widgets/widgets.dart';

/// The selected Movie ID
///
/// It is an error to use [selectedMovieId] without overriding this
/// provider to a non-null value.
final selectedMovieId = Provider<int>((ref) {
  throw UnimplementedError();
});

class MovieDetailScreen extends ConsumerWidget {
  MovieDetailScreen({
    Key? key,
    required this.movieId,
    required this.posterPath,
    required this.transitionAnimation,
  }) : super(key: key);

  final int movieId;
  final String posterPath;
  final Animation<double> transitionAnimation;
  final moviesDetailScreenModel = MoviesDetailScreenModel();

  Iterable<String> _mapGenreToString(List<Genre> genres) {
    return genres.map((genre) => genre.name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailWrap =
        ref.watch(moviesDetailScreenModel.movieDetail(movieId));
    final height = MediaQuery.of(context).size.height;
    return movieDetailWrap.when(
      data: (movieWrap) {
        final movie = movieWrap.movieDetail;
        final chips = List<String>.unmodifiable([
          ..._mapGenreToString(movie.genres),
          movie.runtime.toTimeString(),
        ]);
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          height: height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: AppDimensions.heroImageHeight * 1.1290,
                      child: Hero(
                        tag: movieId,
                        child: CachedNetworkImage(
                          imageUrl: posterPath,
                          imageBuilder: (context, imageProvider) => Container(
                            foregroundDecoration: context.isDarkMode
                                ? AppColors.foregroundDecorationDark
                                : AppColors.foregroundDecorationLight,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(AppDimensions.xsX),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              ImagePlaceholder(
                            imageHeight: AppDimensions.heroImageHeight,
                            imageWidth: double.infinity,
                          ),
                          placeholder: (context, url) => ImagePlaceholder(
                            imageHeight: AppDimensions.heroImageHeight,
                            imageWidth: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: AppDimensions.lgY1,
                      left: AppDimensions.mdX,
                      child: Container(
                        height: AppDimensions.xlgIconImageSizeX,
                        width: AppDimensions.xlgIconImageSizeX,
                        padding: EdgeInsets.all(AppDimensions.xsX),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.xlgIconImageSizeX / 2,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 20.0,
                            color: AppColors.primaryColorAccent,
                          ),
                        ),
                      ),
                    ),
                    // VideoPlayerView(trailerUrl: movieWrap.video.key),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppDimensions.mdX),
                  transform: Matrix4.translationValues(
                    0.0,
                    -AppDimensions.xLgY * 2,
                    0.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeTransition(
                        opacity: transitionAnimation,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                movie.originalTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: AppColors.bodyColorDark,
                                    ),
                              ),
                            ),
                            RatingTile(
                              rating: movie.voteAverage.roundToDouble(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: AppDimensions.chipHeight1,
                        margin: EdgeInsets.only(top: AppDimensions.smX),
                        child: ListView.builder(
                          itemCount: chips.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Material(
                            color: Colors.transparent,
                            child: Container(
                              margin: EdgeInsets.only(right: AppDimensions.smX),
                              child: Chip(
                                label: Text(chips[index]),
                                labelStyle: Theme.of(context)
                                    .chipTheme
                                    .labelStyle
                                    .copyWith(
                                      fontSize: AppDimensions.smallTextFontSize,
                                    ),
                                padding: EdgeInsets.all(AppDimensions.xsX),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.smY),
                      Text(
                        StringResource.movieStory,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      ScaleTransition(
                        scale: transitionAnimation,
                        child: Text(movie.overview,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(height: 1.5)),
                      ),
                      SizedBox(height: AppDimensions.xLgY * 1.5),
                      SizedBox(
                        height: AppDimensions.heroImageHeight,
                        child: const TabView(length: 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (_, __) => const DisplayError(
        errorMessage: StringResource.fetchMovieDetailError,
      ),
      loading: () => const LoadingIndicator(),
    );
  }
}

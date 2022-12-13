import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/common.dart';
import '../screens/movie_detail_screen.dart';
import '../widgets/widgets.dart';
import '../screen_model_providers/movie_detail_screen_model.dart';

class SimilarMovies extends ConsumerWidget {
  SimilarMovies({Key? key}) : super(key: key);

  final moviesDetail = MoviesDetailScreenModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieId = ref.watch(selectedMovieId);
    const imageBase = ImageResource.smApiBaseImageUrl;
    final similarMovies = ref.watch(moviesDetail.similarMovies(movieId));
    return similarMovies.when(
      data: (similarMovies) {
        final moviesSublist = similarMovies.length > 20
            ? similarMovies.sublist(0, 20)
            : similarMovies;
        return Padding(
          padding: EdgeInsets.only(top: AppDimensions.lgY1),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesSublist.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(right: AppDimensions.mdX),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.smX),
                ),
                child: CachedNetworkImage(
                  imageUrl: '$imageBase${moviesSublist[index].posterPath}',
                  errorWidget: (context, url, error) => ImagePlaceholder(
                    imageHeight: AppDimensions.movieCardHeight,
                    imageWidth: AppDimensions.mdCardWidth,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      error: (_, __) => const DisplayError(
        errorMessage: StringResource.fetchCastError,
      ),
      loading: () => const LoadingIndicator(),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/common.dart';
import '../screens/movie_detail_screen.dart';
import '../widgets/widgets.dart';
import '../screen_model_providers/movie_detail_screen_model.dart';

class Actors extends ConsumerWidget {
  Actors({Key? key}) : super(key: key);

  final moviesDetail = MoviesDetailScreenModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieId = ref.watch(selectedMovieId);
    final actors = ref.watch(moviesDetail.movieCast(movieId));
    return actors.when(
      data: (actors) => Padding(
        padding: EdgeInsets.only(top: AppDimensions.lgY1),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: actors.length,
          itemBuilder: (context, index) {
            const imageBase = ImageResource.smApiBaseImageUrl;
            return actors[index].profilePath != null
                ? Container(
                    margin: EdgeInsets.only(right: AppDimensions.mdX),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppDimensions.smX),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: '$imageBase${actors[index].profilePath}',
                        errorWidget: (context, url, error) => ImagePlaceholder(
                          imageHeight: AppDimensions.movieCardHeight,
                          imageWidth: AppDimensions.mdCardWidth,
                        ),
                      ),
                    ),
                  )
                : ImagePlaceholder(
                    imageHeight: AppDimensions.movieCardHeight * 0.65,
                    imageWidth: AppDimensions.mdCardWidth,
                  );
          },
        ),
      ),
      error: (_, __) => const DisplayError(
        errorMessage: StringResource.fetchCastError,
      ),
      loading: () => const LoadingIndicator(),
    );
  }
}

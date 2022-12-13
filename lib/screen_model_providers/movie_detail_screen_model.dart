import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../services/services.dart';

class MoviesDetailScreenModel {
  final movieDetail = FutureProvider.autoDispose
      .family<MovieDetailWrap, int>((ref, movieId) async {
    final movieService = ref.read(movieServiceProvider);

    final movieDetails = await movieService.getMovieDetails(movieId: movieId);
    final trailers = await movieService.getTrailerVideo(movieId: movieId);

    final movieTrailers = trailers.where(
      (trailer) => trailer.official == true && trailer.type == 'Trailer',
    );

    final movieWrap = MovieDetailWrap(
      video: movieTrailers.first,
      movieDetail: movieDetails,
    );

    return movieWrap;
  });

  final movieCast =
      FutureProvider.autoDispose.family<List<Actor>, int>((ref, movieId) {
    final movieService = ref.read(movieServiceProvider);

    return movieService.getCast(movieId: movieId);
  });

  final similarMovies = FutureProvider.autoDispose
      .family<List<MovieResponse>, int>((ref, movieId) {
    final movieService = ref.read(movieServiceProvider);

    return movieService.getSimilarMovies(movieId: movieId);
  });

  // final trailer =
  //     FutureProvider.autoDispose.family<Video, int>((ref, movieId) async {
  //   final movieService = ref.read(movieServiceProvider);
  //   final trailers = await movieService.getTrailerVideo(movieId: movieId);
  //
  //   final movieTrailers = trailers.where(
  //     (trailer) => trailer.official == true && trailer.type == 'Trailer',
  //   );
  //
  //   if (movieTrailers.isEmpty) {
  //     return trailers.first;
  //   }
  //
  //   return movieTrailers.first;
  // });
}

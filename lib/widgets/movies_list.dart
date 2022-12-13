import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets.dart' show DisplayError, LoadingIndicator, Carousel;
import '../common/common.dart';
import '../screen_model_providers/movies_list_screen_model.dart';

class MoviesList extends ConsumerWidget {
  final MoviesListScreenModel _moviesListScreenModel = MoviesListScreenModel();

  MoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesState = ref.watch(
      _moviesListScreenModel.upComingMoviesProvider,
    );
    return moviesState.when(
      data: (movies) => Carousel(
        items: movies,
        sectionTitle: StringResource.upComingTitle,
      ),
      error: (_, __) => const DisplayError(
        errorMessage: StringResource.movieListErrorMessage,
      ),
      loading: () => const LoadingIndicator(),
    );
  }
}

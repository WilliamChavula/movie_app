import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../services/services.dart';

class MoviesListScreenModel {
  final upComingMoviesProvider = FutureProvider<List<MovieResponse>>((ref) {
    final instance = ref.read(movieServiceProvider);
    return instance.getUpcoming();
  });

  final movieGenres = FutureProvider<List<Genre>>((ref) {
    final instance = ref.read(movieServiceProvider);
    return instance.getGenres();
  });
}

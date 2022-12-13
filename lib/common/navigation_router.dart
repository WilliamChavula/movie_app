import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/common.dart';
import '../models/models.dart' show MovieDetailArgs;
import '../screens/screens.dart';

class NavigationRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routePath = settings.name;
    switch (routePath) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MoviesListScreen());
      case '/detail':
        final args = settings.arguments as MovieDetailArgs;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProviderScope(
            overrides: [selectedMovieId.overrideWithValue(args.movieId)],
            child: MovieDetailScreen(
              movieId: args.movieId,
              posterPath: args.posterPath,
              transitionAnimation: animation,
            ),
          ),
          transitionDuration: AppDimensions.animationDuration,
        );
      default:
        return MaterialPageRoute(builder: (_) => const MoviesListScreen());
    }
  }
}

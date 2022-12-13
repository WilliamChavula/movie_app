import 'package:equatable/equatable.dart';

class MovieDetailArgs extends Equatable {
  const MovieDetailArgs({required this.movieId, required this.posterPath});

  final int movieId;
  final String posterPath;

  @override
  List<Object> get props => [movieId, posterPath];
}

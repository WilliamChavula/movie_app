import '../models/models.dart';

abstract class GetMovies {
  Future<List<Actor>> getCast({required int movieId});
  Future<List<Genre>> getGenres();
  Future<List<MovieResponse>> getUpcoming();
  Future<List<MovieResponse>> getSimilarMovies({required int movieId});
  Future<List<Video>> getTrailerVideo({required int movieId});
  Future<MovieDetail> getMovieDetails({required int movieId});
}

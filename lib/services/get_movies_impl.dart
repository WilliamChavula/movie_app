import 'dart:io';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../abstracts/abstracts.dart';
import '../common/common.dart' show StringResource;
import '../config/secrets.dart';
import '../models/models.dart';
import 'internet_exception.dart';

class GetMoviesImpl implements GetMovies {
  GetMoviesImpl();

  final Dio _client = Dio(BaseOptions(
    baseUrl: Config.apiUrl,
    queryParameters: {
      "api_key": Config.apiKey,
      "language": Config.apiLanguage,
    },
  ));

  Future<bool> hasConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }

  @override
  Future<List<MovieResponse>> getUpcoming() async {
    try {
      final hasInternet = await hasConnection();

      if (!hasInternet) {
        throw NoInternetException(StringResource.noInternetError);
      }

      final upcomingResponse = await _client.get(Config.apiUpcomingUrl);

      if (upcomingResponse.statusCode != HttpStatus.ok) {
        throw FetchMoviesException(StringResource.fetchMovieError);
      }

      final movies = upcomingResponse.data['results'];

      return <MovieResponse>[
        for (final movie in movies) MovieResponse.fromJson(movie),
      ];
    } on DioError catch (err) {
      throw FetchMoviesException(err.message);
    }
  }

  @override
  Future<List<Genre>> getGenres() async {
    try {
      final hasInternet = await hasConnection();

      if (!hasInternet) {
        throw NoInternetException(StringResource.noInternetError);
      }

      final genreList = await _client.get(Config.apiMovieGenres);

      if (genreList.statusCode != HttpStatus.ok) {
        throw FetchMoviesException(StringResource.fetchGenresError);
      }

      final genres = genreList.data['genres'];

      return <Genre>[for (final genre in genres) Genre.fromJson(genre)];
    } on DioError catch (err) {
      throw FetchMoviesException(err.message);
    }
  }

  @override
  Future<MovieDetail> getMovieDetails({required int movieId}) async {
    try {
      final hasInternet = await hasConnection();

      if (!hasInternet) {
        throw NoInternetException(StringResource.noInternetError);
      }

      final endpoint = "${Config.apiMovieDetails}/$movieId";
      final movie = await _client.get(endpoint);

      if (movie.statusCode != HttpStatus.ok) {
        throw FetchMoviesException(StringResource.fetchMovieDetailError);
      }

      return MovieDetail.fromJson(movie.data);
    } on DioError catch (err) {
      throw FetchMoviesException(err.message);
    }
  }

  @override
  Future<List<Actor>> getCast({required int movieId}) async {
    try {
      final hasInternet = await hasConnection();

      if (!hasInternet) {
        throw NoInternetException(StringResource.noInternetError);
      }
      final endpoint =
          '${Config.apiUrl}${Config.apiMovieDetails}/$movieId${Config.apiGetcast}';

      final movies = await _client.get(endpoint);

      if (movies.statusCode != HttpStatus.ok) {
        throw FetchMoviesException(StringResource.fetchCastError);
      }

      final cast = movies.data['cast'];
      return <Actor>[for (final actor in cast) Actor.fromJson(actor)];
    } on DioError catch (err) {
      throw FetchMoviesException(err.message);
    }
  }

  @override
  Future<List<MovieResponse>> getSimilarMovies({required int movieId}) async {
    try {
      final hasInternet = await hasConnection();

      if (!hasInternet) {
        throw NoInternetException(StringResource.noInternetError);
      }
      final endpoint =
          '${Config.apiUrl}${Config.apiMovieDetails}/$movieId${Config.apiGetSimilar}';
      final movies = await _client.get(endpoint);

      if (movies.statusCode != HttpStatus.ok) {
        throw FetchMoviesException(StringResource.fetchMovieError);
      }

      final similarMovies = movies.data['results'];

      return <MovieResponse>[
        for (final movie in similarMovies) MovieResponse.fromJson(movie),
      ];
    } on DioError catch (err) {
      throw FetchMoviesException(err.message);
    }
  }

  @override
  Future<List<Video>> getTrailerVideo({required int movieId}) async {
    try {
      final hasInternet = await hasConnection();

      if (!hasInternet) {
        throw NoInternetException(StringResource.noInternetError);
      }
      final endpoint =
          '${Config.apiUrl}${Config.apiMovieDetails}/$movieId${Config.apiGetTrailer}';

      final videos = await _client.get(endpoint);

      if (videos.statusCode != HttpStatus.ok) {
        throw FetchMoviesException(StringResource.fetchTrailerError);
      }

      final trailers = videos.data['results'];
      return <Video>[
        for (final trailer in trailers) Video.fromJson(trailer),
      ];
    } on DioError catch (err) {
      throw FetchMoviesException(err.message);
    }
  }
}

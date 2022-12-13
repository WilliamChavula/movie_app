// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: "genre_ids") required List<int> genreIds,
    @JsonKey(name: "vote_average") required double voteAverage,
    @JsonKey(name: "release_date") required String releaseDate,
    @JsonKey(name: "poster_path") required String posterPath,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}

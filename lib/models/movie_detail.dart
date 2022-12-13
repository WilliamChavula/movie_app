// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'genre.dart';

part 'movie_detail.freezed.dart';
part 'movie_detail.g.dart';

@freezed
class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required int id,
    @JsonKey(name: "original_title") required String originalTitle,
    required List<Genre> genres,
    @JsonKey(name: "adult") required bool isAdult,
    required String overview,
    required int runtime,
    @JsonKey(name: "vote_average") required double voteAverage,
  }) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);
}

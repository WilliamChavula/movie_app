import 'package:equatable/equatable.dart';

import 'movie_detail.dart';
import 'video.dart';

class MovieDetailWrap extends Equatable {
  const MovieDetailWrap({required this.video, required this.movieDetail});

  final MovieDetail movieDetail;
  final Video video;

  @override
  List<Object?> get props => [movieDetail, video];
}

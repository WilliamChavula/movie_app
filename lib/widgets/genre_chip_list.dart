import 'package:flutter/material.dart';
import 'package:movie_directory_app/common/common.dart';

import 'genre_chip.dart';
import '../models/models.dart';

class GenreChipList extends StatelessWidget {
  final List<Genre> genres;

  const GenreChipList({Key? key, required this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.chipHeight1,
      child: ListView.builder(
        itemCount: genres.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GenreChip(
          genreName: genres[index].name,
        ),
      ),
    );
  }
}

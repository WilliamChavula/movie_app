import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../common/common.dart';
import '../models/models.dart';
import '../extensions/string_extensions.dart';
import 'widgets.dart' show RatingTile, ImagePlaceholder;

class Carousel extends StatefulWidget {
  final String? sectionTitle;
  final List<MovieResponse> items;

  const Carousel({
    Key? key,
    required this.items,
    this.sectionTitle,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarourelState();
}

class _CarourelState extends State<Carousel> {
  double? pageOffset = 2;
  final double viewportFraction = 0.55;
  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController(
      initialPage: 2,
      viewportFraction: viewportFraction,
    )..addListener(() {
        setState(() {
          pageOffset = _controller.page!;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppDimensions.lgX2),
          child: Text(
            widget.sectionTitle ?? string.empty,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        SizedBox(height: AppDimensions.smY),
        SizedBox(
          height: AppDimensions.movieCardHeight,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: widget.items.length,
            itemBuilder: (context, pageIndex) {
              double scale = max(
                viewportFraction,
                1 - (pageOffset! - pageIndex).abs() + viewportFraction,
              );
              final path =
                  '${ImageResource.apiBaseImageUrl}${widget.items[pageIndex].posterPath}';
              final movieId = widget.items[pageIndex].id;

              double angleY = (pageOffset! - pageIndex).abs();
              if (angleY > 0.5) {
                angleY = 1 - angleY;
              }
              return Padding(
                padding: EdgeInsets.only(
                  top: AppDimensions.xLgY - scale * AppDimensions.mdY,
                ),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angleY),
                  child: AnimatedOpacity(
                    opacity: pageIndex == pageOffset ? 1 : 0.6,
                    duration: AppDimensions.animationDuration,
                    child: Stack(
                      children: <Widget>[
                        GestureDetector(
                          child: Hero(
                            tag: movieId,
                            child: CachedNetworkImage(
                              imageUrl: path,
                              imageBuilder: (context, provider) => Container(
                                margin: EdgeInsets.all(AppDimensions.smX),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: provider,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppDimensions.xsX),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  ImagePlaceholder(
                                imageHeight: AppDimensions.movieCardHeight,
                                imageWidth: AppDimensions.mdCardWidth,
                              ),
                              placeholder: (context, url) => ImagePlaceholder(
                                imageHeight: AppDimensions.movieCardHeight,
                                imageWidth: AppDimensions.mdCardWidth,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: MovieDetailArgs(
                                movieId: movieId,
                                posterPath: path,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          top: AppDimensions.mdY,
                          right: AppDimensions.lgX1,
                          child: RatingTile(
                            rating: widget.items[pageIndex].voteAverage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

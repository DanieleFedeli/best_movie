import 'package:bestmovies/widget/movie_miniature.dart';
import 'package:flutter/material.dart';

class MovieCarousel extends StatelessWidget {
  final List<MovieMiniature> moviesMiniature;
  final PageController pageController = PageController(viewportFraction: 0.8);

  MovieCarousel({this.moviesMiniature}) : assert(moviesMiniature != null);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        itemCount: moviesMiniature.length,
        itemBuilder: (context, i) {
          return moviesMiniature[i];
        });
  }
}

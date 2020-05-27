import 'package:bestmovies/animation/fade_in.dart';
import 'package:bestmovies/constant.dart';
import 'package:bestmovies/model/movie.dart';
import 'package:bestmovies/widget/fade_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class MovieMiniature extends StatefulWidget {
  final Movie movie;

  MovieMiniature({this.movie}) : assert(movie != null);

  @override
  _MovieMiniatureState createState() => _MovieMiniatureState();
}

class _MovieMiniatureState extends State<MovieMiniature>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  ImageProvider provider;
  Tween<double> fadeIn;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    provider = NetworkImage(hostLinkImage + w500 + widget.movie.posterPath);
    fadeIn = Tween(begin: 0, end: 1);
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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        movieCard(),
        FadeIn(1.0,
            Text(widget.movie.title).textScale(1.5).bold().padding(all: 12)),
        FadeIn(
          1.5,
          Text(
            widget.movie.overview,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1,
          ).textColor(Colors.black45).padding(horizontal: 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text(widget.movie.voteAverage.toString()).bold(),
          ],
        ),
      ],
    );
  }

  movieCard() => FittedBox(
      fit: BoxFit.cover,
      child: FadeImage(imageProvider: provider)
          .clipRRect(all: 45)
          .padding(all: 20));
}

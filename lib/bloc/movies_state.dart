import 'package:bestmovies/model/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesEmpty extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;

  const MoviesLoaded({@required this.movies}) : assert(movies != null);

  @override
  List<Object> get props => [movies];
}

class MoviesError extends MoviesState {
  final String error;

  MoviesError({this.error});

  @override
  List<Object> get props => throw [error];
}

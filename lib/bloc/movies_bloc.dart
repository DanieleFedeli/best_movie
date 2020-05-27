import 'dart:async';

import 'package:bestmovies/repository/movies_repository.dart';
import 'package:bestmovies/repository/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import './bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository moviesRepository;

  @override
  MoviesState get initialState => MoviesEmpty();

  MoviesBloc({@required this.moviesRepository})
      : assert(moviesRepository != null);

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is FetchMovies) {
      yield MoviesLoading();
      final result = await moviesRepository.getPopular(page: event.page);
      if (result is SuccessState) yield MoviesLoaded(movies: result.value);
      else if (result is ErrorState) yield MoviesError(error: result.msg);
    }
  }
}

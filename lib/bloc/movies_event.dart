import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class FetchMovies extends MoviesEvent {
  final int page;

  const FetchMovies({this.page = 1});

  @override
  List<Object> get props => [page];
}

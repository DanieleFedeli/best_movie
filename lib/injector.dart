import 'package:bestmovies/bloc/bloc.dart';
import 'package:bestmovies/repository/movies_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

void startInjection() {
  final instance = GetIt.I;

  instance.registerLazySingleton<Client>(() => Client());
  Client client = instance.get<Client>();

  instance
      .registerLazySingleton<MoviesRepository>(() => MoviesRepository(client));
  MoviesRepository moviesRepository = instance.get<MoviesRepository>();

  instance.registerLazySingleton<MoviesBloc>(
      () => MoviesBloc(moviesRepository: moviesRepository));
}

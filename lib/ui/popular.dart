import 'package:bestmovies/bloc/bloc.dart';
import 'package:bestmovies/constant.dart';
import 'package:bestmovies/model/movie.dart';
import 'package:bestmovies/widget/movie_carousel.dart';
import 'package:bestmovies/widget/movie_miniature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PopularPage extends StatefulWidget {
  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final MoviesBloc moviesBloc = GetIt.I.get<MoviesBloc>();
  List<MovieMiniature> moviesMiniature = <MovieMiniature>[];
  List<String> _selectedGenres = <String>[];

  @override
  void initState() {
    moviesBloc.add(FetchMovies());
    _controller = AnimationController(vsync: this);
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: genreMap.values.length,
              separatorBuilder: (context, i) => SizedBox(
                    width: 10,
                  ),
              itemBuilder: (context, i) {
                String currentGenre = genreMap.values.toList()[i];
                return FilterChip(
                    label: Text(currentGenre),
                    selected: _selectedGenres.contains(currentGenre),
                    onSelected: (v) => setState(() => v
                        ? _selectedGenres.add(currentGenre)
                        : _selectedGenres.remove(currentGenre)));
              }),
        ),
        BlocBuilder<MoviesBloc, MoviesState>(
            bloc: moviesBloc,
            builder: (context, state) {
              if (state is MoviesLoading) return CircularProgressIndicator();
              if (state is MoviesLoaded) {
                genMovieMiniature(state.movies);
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.80,
                    maxWidth: MediaQuery.of(context).size.height * 0.50,
                  ),
                  child: MovieCarousel(
                    moviesMiniature: moviesMiniature,
                  ),
                );
              }
              if (state is MoviesEmpty)
                return Text('Error');
              else
                return Text('Whatzapp');
            }),
      ],
    );
  }

  void genMovieMiniature(movies) {
    if (moviesMiniature == <MovieMiniature>[]) return;
    moviesMiniature = movies
        .map<MovieMiniature>((Movie m) => MovieMiniature(movie: m))
        .toList();
  }
}

class MoviesList extends StatelessWidget {
  final List<Movie> movies;

  MoviesList({this.movies}) : assert(movies != null);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: movies.length,
      separatorBuilder: (context, index) {
        if (index != 0)
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
          );
        else
          return Container();
      },
      itemBuilder: (BuildContext context, int index) {
        ImageProvider provider =
            NetworkImage(hostLinkImage + w92 + movies[index].posterPath);
        return ListTile(
          trailing: CircleAvatar(
            backgroundImage: provider,
          ),
          title: Text(movies[index].title),
          subtitle: Text(
            movies[index].overview,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}

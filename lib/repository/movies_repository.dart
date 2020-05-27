import 'package:bestmovies/constant.dart';
import 'package:bestmovies/helper/ApiHelper.dart';
import 'package:bestmovies/model/movie.dart';
import 'package:bestmovies/repository/states.dart';
import 'package:http/http.dart';

class MoviesRepository {
  final Client _client;

  const MoviesRepository(this._client);

  Future<State> getPopular({page = '1'}) async {
    Map<String, String> queryParameters = {
      "api_key": apiKey,
      "language": "it-IT",
      "page": page.toString(),
    };

    final Uri uri = Uri.https(hostLink, popularMovieLink, queryParameters);
    final result = await getResult(client: _client, uri: uri);

    if (result is SuccessState) {
      List rawList = result.value['results'];
      List<Movie> movies = rawList.map<Movie>((item) => Movie.fromJson(item)).toList();
      return State<List<Movie>>.success(movies);
    }
    return result;
  }
}

import 'dart:convert';
import 'package:bestmovies/repository/states.dart';

Future<State> getResult({client, uri}) async {
  final response = await client.get(uri);

  try {
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));

      return State.success(data);
    } else
      return State<String>.error('Errore: ' + response.statusCode.toString());
  } on Exception {
    return State<String>.error('Errore nella ricezione dei risultati');
  }
}

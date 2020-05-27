import 'package:bestmovies/injector.dart';
import 'package:bestmovies/routes.dart';
import 'package:flutter/material.dart';

void main() {
  startInjection();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.homeRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

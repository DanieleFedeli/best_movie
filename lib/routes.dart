import 'package:bestmovies/layout.dart';
import 'package:bestmovies/ui/popular.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';

  static String currentRoute;

  static Route generateRoute(RouteSettings settings) {
    currentRoute = settings.name;
    switch (settings.name) {
      //case loginRoute:
        //return MaterialPageRoute(builder: (_) => CustomScaffold(LoginPage()));
      case homeRoute:
        return MaterialPageRoute(builder: (_) => CustomScaffold(title: 'Homepage', child: PopularPage()));
      default:
        return null;
    }
  }
}

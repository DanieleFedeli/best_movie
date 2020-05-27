import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final String title;

  //final GlobalKey<ScaffoldState> _scaffoldState;

  const CustomScaffold({this.title, this.child})
      : assert(child != null),
        assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
    );
  }
}

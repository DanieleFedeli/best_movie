import 'package:flutter/material.dart';

class FadeImage extends StatelessWidget {
  final ImageProvider imageProvider;

  const FadeImage({this.imageProvider}) : assert(imageProvider != null);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: NetworkImage('https://via.placeholder.com/500'),
      image: imageProvider,
    );
  }
}

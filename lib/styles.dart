import 'dart:ui';

import 'package:flutter/material.dart';





class Styles {
  static Color appPrimaryColor = Color(0xFF4A73D6);
  static Color appPrimaryColorDark = Color(0xFF3959A3);
  static Color appAccentColor = Color(0xFFCC2323);
  static Color appBackground = Color(0xFFFFECF7);
  static Color commonDarkBackground = Colors.grey[200];
  static Color commonDarkCardBackground = Colors.grey[200]; // #1e2d3b
  static TextTheme appTextTheme = TextTheme(
      headline4: Styles.headline4,
      headline5: Styles.headline5,
      headline6: Styles.headline6,
      bodyText2: Styles.bodyText2,
      bodyText1: Styles.bodyText1,
      caption: Styles.caption);

  static Color appDrawerIconColor = defaultStyle.color;

  static TextStyle appDrawerTextStyle = TextStyle(color: Colors.grey[900]);

  static TextStyle defaultStyle = TextStyle(color: Colors.grey[900]);

  static TextStyle headline4 = defaultStyle.copyWith(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: defaultStyle.color.withOpacity(0.85));

  static TextStyle headline5 = defaultStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: defaultStyle.color.withOpacity(0.85));

  static TextStyle headline6 = defaultStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      height: 22 / 18,
      color: defaultStyle.color.withOpacity(0.85));

  static TextStyle bodyText2 = defaultStyle.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 16,
      color: defaultStyle.color.withOpacity(0.75));

  static TextStyle bodyText1 = defaultStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: defaultStyle.color.withOpacity(0.75));

  static TextStyle caption = defaultStyle.copyWith(
      fontWeight: FontWeight.w300, color: defaultStyle.color.withOpacity(0.65));

  static InputDecoration input = InputDecoration(
    fillColor: Colors.white,
    focusColor: Colors.grey[900],
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2.0,
      ),
    ),
    border: OutlineInputBorder(
      gapPadding: 1.0,
      borderSide: BorderSide(
        color: Colors.grey[600],
        width: 1.0,
      ),
    ),
    hintStyle: TextStyle(
      color: Colors.grey[600],
    ),
  );

  static int redColor = 0xffff2d55;
  static Color tipColor = Color.fromRGBO(255, 226, 108, 1);
  static Color matchWonCardSideColor = Color.fromRGBO(22, 160, 133, 1);
  static Color matchLostCardSideColor = Color.fromRGBO(211, 84, 0, 1);
  static Color vipCardBgColor = Colors.orange[100];

  // forums
  static Color forumBgColor = Color.fromRGBO(37, 35, 49, 1);

  static Color leftMessageBgColor = Color.fromRGBO(52, 49, 69, 1);
  static Color leftMessageAkaColor = Color.fromRGBO(107, 108, 127, 1);
  static Color leftMessageMessageColor = Colors.white;

  static Color rightMessageBgColor = Color.fromRGBO(37, 105, 253, 1);
  static Color rightMessageAkaColor = Color.fromRGBO(139, 172, 244, 1);
  static Color rightMessageMessageColor = Colors.white;
}

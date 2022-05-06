
import 'package:flutter/material.dart';

ThemeData global_theme() => ThemeData(
    fontFamily: 'Georgia',
    splashColor: Colors.yellow,

    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      primarySwatch: Colors.orange,
    ).copyWith(
      secondary: Colors.green,
    ),

    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind', color: Colors.amber),
    )
);

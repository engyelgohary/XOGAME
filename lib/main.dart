import 'package:flutter/material.dart';
import 'package:xogame/Xo%20Game.dart';
import 'package:xogame/nameScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      initialRoute: PlayerName.routeName,
      routes: {
      PlayerName.routeName : (context) => PlayerName(),
      Xogame.routeName : (context) => Xogame(),
      },
    );
  }
}
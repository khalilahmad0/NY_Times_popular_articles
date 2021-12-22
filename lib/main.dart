import 'package:flutter/material.dart';
import 'package:ny_times_popular_articles/utils/constants.dart';
import 'package:ny_times_popular_articles/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: Constants.appTitle,
    home: const HomeScreen(),
    theme: ThemeData(
      primaryTextTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(80, 226, 195, 1)
      ),
    ),
  );
}

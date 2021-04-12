import 'package:flutter/material.dart';
import 'package:projekt_prj/library_pages/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}




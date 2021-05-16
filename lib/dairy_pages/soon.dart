import 'package:loading_animations/loading_animations.dart';
import 'package:flutter/material.dart';
import '../quote.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text(''),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: ClipPath(
            clipper: MyCustomClipperForAppBar(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  'This page is preparing for you',
                  style: TextStyle(
                    fontSize: 22.0,
                    wordSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 30.0),
                LoadingBouncingGrid.square(
                  borderSize: 5.0,
                  borderColor:  Color(0xFF1976D2),
                  size: 300.0,
                  backgroundColor: Color(0xFF42A5F5),
                  duration: Duration(milliseconds: 1500),
                  inverted: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:walkthroughapp/splash_screen.dart';
void main() {
  runApp( MaterialApp(
    initialRoute: '/splashScreen',
    debugShowCheckedModeBanner: false,
    routes: {
      '/splashScreen':(context) => SplashScreen(),


    },
  ));
}
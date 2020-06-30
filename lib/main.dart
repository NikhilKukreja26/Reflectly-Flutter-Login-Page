import 'package:flutter/material.dart';
import './screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reflectly Flutter Login-Page',
      theme: ThemeData(
        primaryColor: const Color(0xFF8185E2),
      ),
      home: SplashScreen(),
    );
  }
}

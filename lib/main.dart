import 'package:flutter/material.dart';
import 'package:untitled/Screens/splash_screen.dart';

import 'Screens/my_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner:false,
      home:const SplashScreen(),
    );
  }
}

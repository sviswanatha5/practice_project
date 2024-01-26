import 'package:flutter/material.dart';
import 'package:practice_project/screens/home_screen.dart';

void main() {
  runApp(
    const Directionality(
      textDirection: TextDirection.ltr,
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen());
  }
}

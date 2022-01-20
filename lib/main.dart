import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/finish_page.dart';
import 'package:flutter_quiz_app/screens/main_page.dart';
import 'package:flutter_quiz_app/screens/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

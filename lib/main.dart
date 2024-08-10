import 'package:flutter/material.dart';
import 'package:todo_app/view/home_screen/home_screen.dart';
import 'package:todo_app/view/welcome_page/welcome_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

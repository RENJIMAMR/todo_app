import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/utils/app_sessions.dart';
import 'package:todo_app/view/home_screen/home_screen.dart';
import 'package:todo_app/view/welcome_page/welcome_page.dart';

Future<void> main(List<String> args) async {
  await Hive.initFlutter();
  var box = await Hive.openBox(AppSessions.ListBox);
  var box2 = await Hive.openBox(AppSessions.FinishedBox);

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

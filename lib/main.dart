import 'package:flutter/material.dart';
import 'package:rest_api_session_2/pages/homework_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeworkPage());
  }
}

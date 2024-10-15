import 'package:flutter/material.dart';
import 'package:flutter_pr7/presentation/homePage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 241, 222, 14)),
        useMaterial3: true,
      ),
      
      home: HomePage()
    );
  }
}

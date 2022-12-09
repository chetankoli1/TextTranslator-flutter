import 'package:flutter/material.dart';
import 'package:text_translatter/HomePage.dart';
import 'package:text_translatter/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red,
          primarySwatch: Colors.yellow,
          scaffoldBackgroundColor: const Color.fromARGB(255, 243, 248, 140)),
      home: const SplashScre(),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:text_translatter/HomePage.dart';

class SplashScre extends StatefulWidget {
  const SplashScre({super.key});

  @override
  State<SplashScre> createState() => _SplashScreState();
}

class _SplashScreState extends State<SplashScre> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('./assets/welcome.png'), fit: BoxFit.cover),
        ),
        child: null);
  }
}

import 'package:flutter/material.dart';
import 'package:nasa_workshop/presentation/home/page/home_screen.dart';

class NasaApp extends StatelessWidget {
  const NasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA Test Workshop',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}

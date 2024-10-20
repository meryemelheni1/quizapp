import 'package:flutter/material.dart';
import 'accueil.dart';
import 'homepage.dart';
import 'about.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Welcome Quiz Game ',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, // This removes the debug banner
      initialRoute: '/',
      routes: {
        '/': (context) => const Accueil(),
        '/home': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}

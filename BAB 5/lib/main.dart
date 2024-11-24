import 'package:babv/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BookManagement());
}
class BookManagement extends StatelessWidget {
  const BookManagement({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}


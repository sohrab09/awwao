import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Hind Siliguri',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Hello World', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EnglishScreen extends StatefulWidget {
  const EnglishScreen({super.key});

  @override
  State<EnglishScreen> createState() => _EnglishScreenState();
}

class _EnglishScreenState extends State<EnglishScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('English Screen')),
      body: Center(
        child: Text(
          'This is English Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

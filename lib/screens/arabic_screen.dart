import 'package:flutter/material.dart';

class ArabicScreen extends StatefulWidget {
  const ArabicScreen({super.key});

  @override
  State<ArabicScreen> createState() => _ArabicScreenState();
}

class _ArabicScreenState extends State<ArabicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Arabic Screen')),
      body: Center(
        child: Text(
          'This is Arabic Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

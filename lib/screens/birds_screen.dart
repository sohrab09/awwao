import 'package:flutter/material.dart';

class BirdsScreen extends StatefulWidget {
  const BirdsScreen({super.key});

  @override
  State<BirdsScreen> createState() => _BirdsScreenState();
}

class _BirdsScreenState extends State<BirdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Birds Screen')),
      body: Center(
        child: Text(
          'This is Birds Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

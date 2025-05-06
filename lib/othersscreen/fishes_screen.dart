import 'package:flutter/material.dart';

class FishesScreen extends StatefulWidget {
  const FishesScreen({super.key});

  @override
  State<FishesScreen> createState() => _FishesScreenState();
}

class _FishesScreenState extends State<FishesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fishes Screen')),
      body: Center(
        child: Text(
          'This is Fishes Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

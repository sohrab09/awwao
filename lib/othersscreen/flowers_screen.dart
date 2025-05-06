import 'package:flutter/material.dart';

class FlowersScreen extends StatefulWidget {
  const FlowersScreen({super.key});

  @override
  State<FlowersScreen> createState() => _FlowersScreenState();
}

class _FlowersScreenState extends State<FlowersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flowers Screen')),
      body: Center(
        child: Text(
          'This is Flowers Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

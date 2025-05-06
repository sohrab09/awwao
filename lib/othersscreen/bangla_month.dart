import 'package:flutter/material.dart';

class BanglaMonth extends StatelessWidget {
  const BanglaMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('মাস'),
        backgroundColor: const Color(0xFFEC1D8F),
      ),
      body: Center(
        child: Text(
          'মাস শেখার জন্য এখানে কন্টেন্ট যোগ করুন।',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

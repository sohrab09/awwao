import 'package:flutter/material.dart';

class BanglaPoem extends StatelessWidget {
  const BanglaPoem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('কবিতা'),
        backgroundColor: const Color(0xFF795548),
      ),
      body: Center(
        child: Text(
          'কবিতা শেখার জন্য এখানে কন্টেন্ট যোগ করুন।',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

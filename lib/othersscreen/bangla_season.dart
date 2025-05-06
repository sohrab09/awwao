import 'package:flutter/material.dart';

class BanglaSeason extends StatelessWidget {
  const BanglaSeason({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ঋতু'),
        backgroundColor: const Color(0xFF00BCD4),
      ),
      body: Center(
        child: Text(
          'ঋতু শেখার জন্য এখানে কন্টেন্ট যোগ করুন।',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

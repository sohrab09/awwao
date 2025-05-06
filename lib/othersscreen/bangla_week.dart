import 'package:flutter/material.dart';

class BanglaWeek extends StatelessWidget {
  const BanglaWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সপ্তাহ'),
        backgroundColor: const Color(0xFF9C27B0),
      ),
      body: Center(
        child: Text(
          'সপ্তাহ শেখার জন্য এখানে কন্টেন্ট যোগ করুন।',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

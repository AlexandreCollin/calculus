import 'package:calculus/pages/start/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Calculus());
}

class Calculus extends StatelessWidget {
  const Calculus({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

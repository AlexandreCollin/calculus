import 'package:calculus/pages/start/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Calculus());
}

class Calculus extends StatelessWidget {
  const Calculus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
    );
  }
}

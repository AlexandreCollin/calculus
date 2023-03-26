import 'package:calculus/pages/game/components/answers.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> answers = ["1", "2", "3", "4"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text("Calculus here"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Answers(
                answers: answers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:calculus/pages/game/components/answers.dart';
import 'package:calculus/pages/game/models/question.dart';
import 'package:calculus/pages/game/utils/question_generator.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Question _actualQuestion;
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    _actualQuestion = QuestionGenerator.easy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        _actualQuestion.operation,
                        style: const TextStyle(
                          fontSize: 42,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () => setState(() {
                      _actualQuestion = QuestionGenerator.easy();
                    }),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Answers(
                question: _actualQuestion,
                onAnswer: (answer) => setState(() {
                  selectedAnswer = answer;
                }),
                answer: selectedAnswer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

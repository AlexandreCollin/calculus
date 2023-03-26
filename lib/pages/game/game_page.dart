import 'package:calculus/pages/game/components/answers.dart';
import 'package:calculus/pages/game/models/question.dart';
import 'package:calculus/pages/game/utils/question_generator.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
    required this.difficulty,
  });

  final Difficulty difficulty;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Question _actualQuestion;
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    _actualQuestion = QuestionGenerator.byDifficulty(widget.difficulty);
  }

  void _nextQuestion() {
    setState(() {
      selectedAnswer = null;
      _actualQuestion = QuestionGenerator.byDifficulty(widget.difficulty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                _actualQuestion.operation,
                style: const TextStyle(
                  fontSize: 42,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Answers(
              question: _actualQuestion,
              onAnswer: (answer) {
                if (selectedAnswer == null) {
                  setState(() {
                    selectedAnswer = answer;
                  });
                  Future.delayed(
                    const Duration(seconds: 1),
                    _nextQuestion,
                  );
                }
              },
              answer: selectedAnswer,
            ),
          ),
        ],
      ),
    );
  }
}

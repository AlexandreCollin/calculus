import 'package:calculus/pages/game/models/question.dart';
import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.answer,
  });

  final Question question;
  final Function(String) onAnswer;
  final String? answer;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: question.answers.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onTap: () => onAnswer(e),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: answer == null
                        ? Colors.white
                        : question.value == e
                            ? Colors.green
                            : answer == e
                                ? Colors.red
                                : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontSize: 42,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

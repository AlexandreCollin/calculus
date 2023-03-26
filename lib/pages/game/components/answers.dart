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
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: (question.answers.length / 2).round(),
            childAspectRatio: 0.8,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            children: question.answers.map((e) {
              return InkWell(
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
                  child: Center(
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 42,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

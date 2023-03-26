import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({
    super.key,
    required this.answers,
  }) : assert(answers.length > 0);

  final List<String> answers;

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
            crossAxisCount: (answers.length / 2).round(),
            childAspectRatio: 0.8,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            children: answers.map((e) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
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
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

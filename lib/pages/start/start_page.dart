import 'package:calculus/pages/game/game_page.dart';
import 'package:calculus/pages/game/utils/question_generator.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Difficulty _difficulty = Difficulty.easy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 23.0),
                      child: Text("Difficulty"),
                    ),
                    Slider(
                      label: _difficulty.name,
                      value: _difficulty.value.toDouble(),
                      max: Difficulty.hard.value.toDouble(),
                      divisions: 2,
                      onChanged: (value) {
                        setState(() {
                          _difficulty = Difficulty.values[value.toInt()];
                        });
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GamePage(
                      difficulty: _difficulty,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 42.0,
                    vertical: 16.0,
                  ),
                  child: Text("Start"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

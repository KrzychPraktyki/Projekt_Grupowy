import 'package:flutter/material.dart';
class ProbabilityCalc extends StatelessWidget {
  const ProbabilityCalc({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 18));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator prawdopodobieństwa'),
      ),
      body: Center(
        child: ElevatedButton(
          style: style,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('back!'),
        ),
      ),
    );
  }
}
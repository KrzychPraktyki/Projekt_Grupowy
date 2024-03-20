import 'package:flutter/material.dart';
import 'language.dart';

class ProbabilityCalculator extends StatefulWidget {
  const ProbabilityCalculator({Key? key}) : super(key: key);

  @override
  _ProbabilityCalculatorState createState() => _ProbabilityCalculatorState();
}

class _ProbabilityCalculatorState extends State<ProbabilityCalculator> {
  TextEditingController eventController = TextEditingController();
  TextEditingController sampleSpaceController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.getTranslatedValue('Kalkulator Prawdopodobieństwa')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: eventController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: AppLocalization.getTranslatedValue('Liczba korzystnych zdarzeń'),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: sampleSpaceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: AppLocalization.getTranslatedValue('Liczba wszystkich możliwych zdarzeń'),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                calculateProbability();
              },
              child: Text(AppLocalization.getTranslatedValue('Oblicz')),
            ),
            const SizedBox(height: 20.0),
            Text(AppLocalization.getTranslatedValue('Wynik'),style: TextStyle(fontSize: 18.0)),
            Text(': $result',style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  void calculateProbability() {
    int event = int.tryParse(eventController.text) ?? 0;
    int sampleSpace = int.tryParse(sampleSpaceController.text) ?? 0;

    if (sampleSpace != 0) {
      double probability = event / sampleSpace;
      setState(() {
        result = probability.toStringAsFixed(4);
      });
    } else {
      setState(() {
        result = AppLocalization.getTranslatedValue('Nieprawidłowe dane');
      });
    }
  }
}
import 'package:flutter/material.dart';
import 'language.dart';
import 'MartynaLeman.dart';

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
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: Themeslist().themeses[themeIndex],
        home:Scaffold(
          resizeToAvoidBottomInset: false,


          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(AppLocalization.getTranslatedValue('Propability Calculator')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: eventController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: AppLocalization.getTranslatedValue('Number of Favorable Outcomes'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: sampleSpaceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: AppLocalization.getTranslatedValue('Total Number of Possible Outcomes'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    calculateProbability();
                  },
                  child: Text(AppLocalization.getTranslatedValue('Calculate')),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  AppLocalization.getTranslatedValue('Result:'),
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 8),
                Text(
                  ' ' + (result.isEmpty ? '' : '$result%'),
                  style: TextStyle(fontSize: 24.0),
                ),
              ],
            ),
          ),
        ));

  }

  void calculateProbability() {
    int event = int.tryParse(eventController.text) ?? 0;
    int sampleSpace = int.tryParse(sampleSpaceController.text) ?? 0;

    if (sampleSpace != 0) {
      double probability = (event / sampleSpace) * 100;
      setState(() {
        if (probability % 1 == 0) {
          result = probability.round().toString();
        } else {
          result = probability.toStringAsFixed(2);
        }
      });
    } else {
      setState(() {
        result = AppLocalization.getTranslatedValue('Incorrect data');
      });
    }
  }
}

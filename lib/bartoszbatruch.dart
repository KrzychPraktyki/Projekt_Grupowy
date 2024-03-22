import 'package:flutter/material.dart';
import 'language.dart';
import 'martynaleman.dart';
import 'unitlists.dart';

void main() {
  runApp(MaterialApp(
    title: 'Unit Converter',
    debugShowCheckedModeBanner: false,
    theme: Themeslist().themeses[themeIndex],
    home: const CzwartaStrona(),
  ));
}

class CzwartaStrona extends StatelessWidget {
  const CzwartaStrona({super.key});

  @override
  Widget build(BuildContext context) {
    return const UnitConverter();
  }
}

class UnitConverter extends StatefulWidget {
  const UnitConverter({super.key});

  @override
  State<UnitConverter> createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  final TextEditingController _inputController = TextEditingController();
  double? _result;
  String? _selectedInputUnit;
  String? _selectedOutputUnit;
  final List<String> _inputUnits = allUnits;

  List<String> _outputUnits = [];

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 23));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themeslist().themeses[themeIndex],
        home:Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
                AppLocalization.getTranslatedValue('Unit Conventer')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedInputUnit,
                  items: _inputUnits.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit, style: const TextStyle(fontSize: 20.0)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedInputUnit = newValue;
                      _selectedOutputUnit = null;
                      if(distanceUnits.contains(newValue)){
                        _outputUnits = distanceUnits;
                      }
                      if (weightUnits.contains(newValue)){
                        _outputUnits = weightUnits;
                      }
                      if (timeUnits.contains(newValue)){
                        _outputUnits = timeUnits;
                      }
                      if (gradeUnits.contains(newValue)){
                        _outputUnits = gradeUnits;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: AppLocalization.getTranslatedValue('Select Input Unit'),
                    labelStyle: const TextStyle(fontSize: 25.0),
                  ),
                ),
                TextField(
                  controller: _inputController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: AppLocalization.getTranslatedValue('Enter a Value'),
                    labelStyle: const TextStyle(fontSize: 20.0),
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedOutputUnit,
                  items: _outputUnits.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit, style: const TextStyle(fontSize: 20.0)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOutputUnit = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: AppLocalization.getTranslatedValue('Select Output Unit'),
                    labelStyle: const TextStyle(fontSize: 25.0),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(30.0),
                      child: Center(
                        child: ElevatedButton(
                          style: style,
                          onPressed: () {
                            try {
                              setState(() {
                                _result = convert(
                                    _inputController.text, _selectedInputUnit!,
                                    _selectedOutputUnit!);
                              });
                            } catch (e) {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    AlertDialog(
                                      title: Text(
                                          AppLocalization.getTranslatedValue('Error')),
                                      content: Text(e.toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                              AppLocalization.getTranslatedValue('OK')),
                                        ),
                                      ],
                                    ),
                              );
                            }
                          },
                          child: Text(
                              AppLocalization.getTranslatedValue('Convert')),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                if (_result != null)
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple)),
                    child: Center(
                      child: Text(
                          'Result: $_result', style: (const TextStyle(fontSize: 30.0))),
                    ),
                  ),
              ],
            ),
          ),
        )
    );
  }


  double convert(String input, String inputUnit, String outputUnit) {
    double value = double.tryParse(input) ?? 0.0;
    double result = 0.0;

    if (inputUnit == outputUnit) {
      result = value;
    } else {
      if (isMetric(inputUnit) && isMetric(outputUnit)) {
        result = value * getMetricConversionFactor(inputUnit) /
            getMetricConversionFactor(outputUnit);
      }
      else if (isImperial(inputUnit) && isImperial(outputUnit)) {
        result = value * getImperialConversionFactor(inputUnit) /
            getImperialConversionFactor(outputUnit);
      }
      else if (isMetric(inputUnit) && isImperial(outputUnit)) {
        result =
            value / getMetricToImperialConversionFactor(inputUnit, outputUnit);
      }
      else if (isImperial(inputUnit) && isMetric(outputUnit)) {
        result =
            value * getMetricToImperialConversionFactor(outputUnit, inputUnit);
      }
    }

    return result;
  }
  bool isMetric(String unit) {
    return metricUnits.contains(unit);
  }

  bool isImperial(String unit) {
    return imperialUnits.contains(unit);
  }

  double getMetricConversionFactor(String unit) {
    switch (unit) {
      case 'Metr':
        return 1.0;
      case 'Kilometr':
        return 1000.0;
      case 'Centymetr':
        return 0.01;
      case 'Gram':
        return 1.0;
      case 'Kilogram':
        return 1000.0;
      case 'Sekunda':
        return 1.0;
      case 'Minuta':
        return 60.0;
      case 'Godzina':
        return 3600.0;
      case 'Celsiusz':
        return 1.0;
      default:
        throw Exception('Nieznana jednostka: $unit');
    }
  }

  double getImperialConversionFactor(String unit) {
    switch (unit) {
      case 'Stopa':
        return 0.3048;
      case 'Mila':
        return 1609.34;
      case 'Cal':
        return 0.0254;
      case 'Uncja':
        return 28.3495;
      case 'Funt':
        return 453.592;
      case 'Kelwin':
        return 1.0;
      default:
        throw Exception('Nieznana jednostka: $unit');
    }
  }

  double getMetricToImperialConversionFactor(String metricUnit, String imperialUnit) {
    double baseValue = metricUnit == 'Celsiusz' ? 1.0 : getMetricConversionFactor(metricUnit);
    double imperialValue = baseValue * getImperialConversionFactor(imperialUnit);
    return imperialValue;
  }
}
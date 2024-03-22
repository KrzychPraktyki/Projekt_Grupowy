import 'package:flutter/material.dart';
import 'language.dart';
import 'MartynaLeman.dart';
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
  final List<String> _inputUnits = [];
  final List<String> _outputUnits = [];

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
                AppLocalization.getTranslatedValue('Unit Converter')),
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
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Wybierz jednostkę wejściową',
                    labelStyle: TextStyle(fontSize: 25.0),
                  ),
                ),
                TextField(
                  controller: _inputController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Wpisz wartość',
                    labelStyle: TextStyle(fontSize: 20.0),
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
                  decoration: const InputDecoration(
                    labelText: 'Wybierz jednostkę wyjściową',
                    labelStyle: TextStyle(fontSize: 25.0),
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
                                          AppLocalization.getTranslatedValue(
                                              'Błąd')),
                                      content: Text(e.toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                              AppLocalization.getTranslatedValue(
                                                  'OK')),
                                        ),
                                      ],
                                    ),
                              );
                            }
                          },
                          child: Text(
                              AppLocalization.getTranslatedValue('Konwertuj')),
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

  @override
  void initState() {
    super.initState();
    _inputUnits.addAll([
      'Metr',
      'Kilometr',
      'Centymetr',
      'Gram',
      'Kilogram',
      'Sekunda',
      'Minuta',
      'Godzina',
      'Celsiusz',
      'Stopa',
      'Mila',
      'Cal',
      'Uncja',
      'Funt',
      'Kelwin'
    ]);
    _outputUnits.addAll([
      'Metr',
      'Kilometr',
      'Centymetr',
      'Gram',
      'Kilogram',
      'Sekunda',
      'Minuta',
      'Godzina',
      'Celsiusz',
      'Stopa',
      'Mila',
      'Cal',
      'Uncja',
      'Funt',
      'Kelwin'
    ]);
    _selectedInputUnit = _inputUnits.isNotEmpty ? _inputUnits.first : null;
    _selectedOutputUnit = _outputUnits.isNotEmpty ? _outputUnits.first : null;
  }

  double convert(String input, String inputUnit, String outputUnit) {
    double value = double.tryParse(input) ?? 0.0;
    double result = 0.0;

    if (!areUnitsCompatible(inputUnit, outputUnit)) {
      throw Exception(
          'Niewłaściwe jednostki do zamiany: $inputUnit na $outputUnit');
    }

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

  bool areUnitsCompatible(String unit1, String unit2) {
    if (unit1 == 'Metr' || unit2 == 'Metr') {
      List<List<String>> incompatibleUnits = [
        [
          'Metr',
          'Gram',
          'Kilogram',
          'Funt',
          'Uncja',
          'Minuta',
          'Godzina',
          'Sekunda',
          'Kelwin',
          'Celsiusz'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Kilometr' || unit2 == 'Kilometr') {
      List<List<String>> incompatibleUnits = [
        [
          'Kilometr',
          'Gram',
          'Kilogram',
          'Funt',
          'Uncja',
          'Minuta',
          'Godzina',
          'Sekunda',
          'Kelwin',
          'Celsiusz'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Centymetr' || unit2 == 'Centymetr') {
      List<List<String>> incompatibleUnits = [
        [
          'Centymetr',
          'Gram',
          'Kilogram',
          'Funt',
          'Uncja',
          'Minuta',
          'Godzina',
          'Sekunda',
          'Kelwin',
          'Celsiusz'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Mila' || unit2 == 'Mila') {
      List<List<String>> incompatibleUnits = [
        [
          'Mila',
          'Gram',
          'Kilogram',
          'Funt',
          'Uncja',
          'Minuta',
          'Godzina',
          'Sekunda',
          'Kelwin',
          'Celsiusz'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Cal' || unit2 == 'Cal') {
      List<List<String>> incompatibleUnits = [
        [
          'Cal',
          'Gram',
          'Kilogram',
          'Funt',
          'Uncja',
          'Minuta',
          'Godzina',
          'Sekunda',
          'Kelwin',
          'Celsiusz'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Stopa' || unit2 == 'Stopa') {
      List<List<String>> incompatibleUnits = [
        [
          'Stopa',
          'Gram',
          'Kilogram',
          'Funt',
          'Uncja',
          'Minuta',
          'Godzina',
          'Sekunda',
          'Kelwin',
          'Celsiusz'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Gram' || unit2 == 'Gram') {
      List<List<String>> incompatibleUnits = [
        [
          'Gram',
          'Kilometr',
          'Metr',
          'Centymetr',
          'Mila',
          'Cal',
          'Minuta',
          'Godzina',
          'Sekunda',
          'Kelwin',
          'Celsiusz',
          'Stopa'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Kilogram' || unit2 == 'Kilogram') {
      List<List<String>> incompatibleUnits = [
        [
          'Kilogram',
          'Kilometr',
          'Metr',
          'Centymetr',
          'Mila',
          'Cal',
          'Minuta',
          'Godzina',
          'Sekunda',
          'Kelwin',
          'Celsiusz',
          'Foot'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Uncja' || unit2 == 'Uncja') {
      List<List<String>> incompatibleUnits = [
        [
          'Uncja',
          'Kilometr',
          'Metr',
          'Centymetr',
          'Mila',
          'Cal',
          'Minuta',
          'Godzina',
          'Sekunda',
          'Fahrenheit',
          'Celsius',
          'Foot'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Funt' || unit2 == 'Funt') {
      List<List<String>> incompatibleUnits = [
        [
          'Funt',
          'Kilometr',
          'Metr',
          'Centymetr',
          'Mila',
          'Cal',
          'Minuta',
          'Godzina',
          'Sekunda',
          'Kelwin',
          'Celsiusz',
          'Stopa'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Sekunda' || unit2 == 'Sekunda') {
      List<List<String>> incompatibleUnits = [
        [
          'Sekunda',
          'Kilometr',
          'Metr',
          'Centymetr',
          'Mila',
          'Cal',
          'Gram',
          'Kilogram',
          'Uncja',
          'Funt',
          'Kelwin',
          'Celsiusz',
          'Stopa'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Minuta' || unit2 == 'Minuta') {
      List<List<String>> incompatibleUnits = [
        [
          'Minuta',
          'Kilometr',
          'Metr',
          'Centimetr',
          'Mila',
          'Cal',
          'Gram',
          'Kilogram',
          'Uncja',
          'Funt',
          'Kelwin',
          'Celsiusz',
          'Stopa'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Godzina' || unit2 == 'Godzina') {
      List<List<String>> incompatibleUnits = [
        [
          'Godizna',
          'Kilometr',
          'Metr',
          'Centymetr',
          'Mila',
          'Cal',
          'Gram',
          'Kilogram',
          'Uncja',
          'Funt',
          'Kelwin',
          'Celsiusz',
          'Stopa'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Celsiusz' || unit2 == 'Celsiusz') {
      List<List<String>> incompatibleUnits = [
        [
          'Celsiusz',
          'Kilometr',
          'Metr',
          'Centymetr',
          'Mila',
          'Cal',
          'Gram',
          'Kilogram',
          'Uncja',
          'Funt',
          'Sekunda',
          'Minuta',
          'Godzina',
          'Stopa'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else if (unit1 == 'Kelwin' || unit2 == 'Kelvin') {
      List<List<String>> incompatibleUnits = [
        [
          'Kelvin',
          'Kilometr',
          'Metr',
          'Centymetr',
          'Mila',
          'Cal',
          'Gram',
          'Kilogram',
          'Uncja',
          'Funt',
          'Sekunda',
          'Minuta',
          'Godzina',
          'Stopa'
        ],
      ];

      for (var pair in incompatibleUnits) {
        if (pair.contains(unit1) && pair.contains(unit2)) {
          return false;
        }
      }

      return true;
    } else {
      return true;
    }
  }


  bool isMetric(String unit) {
    return [
      'Metr',
      'Kilometr',
      'Centymetr',
      'Gram',
      'Kilogram',
      'Sekunda',
      'Minuta',
      'Godzina',
      'Celsiusz'
    ].contains(unit);
  }

  bool isImperial(String unit) {
    return ['Stopa', 'Mila', 'Cal', 'Uncja', 'Funt', 'Kelwin'].contains(unit);
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
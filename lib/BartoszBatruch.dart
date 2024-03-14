import 'package:flutter/material.dart';
class CzwartaStrona extends StatelessWidget {
  const CzwartaStrona({super.key});

  void main() {
  runApp(MaterialApp(
    title: 'Unit Converter',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: UnitConverter(),
  ));
}

class UnitConverter extends StatefulWidget {
  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  final TextEditingController _inputController = TextEditingController();
  double? _result;
  String? _selectedInputUnit;
  String? _selectedOutputUnit;
  List<String> _inputUnits = [];
  List<String> _outputUnits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
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
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedInputUnit = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Input Unit',
              ),
            ),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Value',
              ),
            ),
            DropdownButtonFormField<String>(
              value: _selectedOutputUnit,
              items: _outputUnits.map((unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOutputUnit = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Output Unit',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  setState(() {
                    _result = convert(_inputController.text, _selectedInputUnit!, _selectedOutputUnit!);
                  });
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text(e.toString()),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            if (_result != null)
              Text('Result: $_result')
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _inputUnits.addAll(['Meter', 'Kilometer', 'Centimeter', 'Gram', 'Kilogram', 'Second', 'Minute', 'Hour', 'Celsius']);
    _outputUnits.addAll(['Meter', 'Kilometer', 'Centimeter', 'Gram', 'Kilogram', 'Second', 'Minute', 'Hour', 'Celsius']);
    _selectedInputUnit = _inputUnits.first;
    _selectedOutputUnit = _outputUnits.first;
  }

  double convert(String input, String inputUnit, String outputUnit) {
    double value = double.parse(input);
    double result = 0.0;

    // Check if the units are compatible for conversion
    if (!areUnitsCompatible(inputUnit, outputUnit)) {
      throw Exception('Incompatible units for conversion: $inputUnit to $outputUnit');
    }

    if (inputUnit == outputUnit) {
      result = value;
    } else {
      // Metric to Metric conversions
      if (isMetric(inputUnit) && isMetric(outputUnit)) {
        result = value * getMetricConversionFactor(inputUnit) / getMetricConversionFactor(outputUnit);
      }
      // Imperial to Imperial conversions
      else if (isImperial(inputUnit) && isImperial(outputUnit)) {
        result = value * getImperialConversionFactor(inputUnit) / getImperialConversionFactor(outputUnit);
      }
      // Metric to Imperial conversions
      else if (isMetric(inputUnit) && isImperial(outputUnit)) {
        result = value * getMetricToImperialConversionFactor(inputUnit, outputUnit);
      }
      // Imperial to Metric conversions
      else if (isImperial(inputUnit) && isMetric(outputUnit)) {
        result = value / getMetricToImperialConversionFactor(outputUnit, inputUnit);
      }
    }

    return result;
  }

  bool areUnitsCompatible(String unit1, String unit2) {
    // List of incompatible unit pairs
    List<List<String>> incompatibleUnits = [
      ['Meter', 'Gram'],
      // Add more incompatible pairs here if needed
    ];

    // Check if the unit pair exists in the list of incompatible units
    for (var pair in incompatibleUnits) {
      if (pair.contains(unit1) && pair.contains(unit2)) {
        return false;
      }
    }

    return true;
  }

  bool isMetric(String unit) {
    return ['Meter', 'Kilometer', 'Centimeter', 'Gram', 'Kilogram', 'Second', 'Minute', 'Hour', 'Celsius'].contains(unit);
  }

  bool isImperial(String unit) {
    return ['Foot', 'Mile', 'Inch', 'Ounce', 'Pound', 'Fahrenheit'].contains(unit);
  }

  double getMetricConversionFactor(String unit) {
    switch (unit) {
      case 'Meter':
        return 1.0;
      case 'Kilometer':
        return 1000.0;
      case 'Centimeter':
        return 0.01;
      case 'Gram':
        return 1.0;
      case 'Kilogram':
        return 1000.0;
      case 'Second':
        return 1.0;
      case 'Minute':
        return 60.0;
      case 'Hour':
        return 3600.0;
      case 'Celsius':
        return 1.0;
      default:
        throw Exception('Unknown metric unit: $unit');
    }
  }

  double getImperialConversionFactor(String unit) {
    switch (unit) {
      case 'Foot':
        return 0.3048;
      case 'Mile':
        return 1609.34;
      case 'Inch':
        return 0.0254;
      case 'Ounce':
        return 28.3495;
      case 'Pound':
        return 453.592;
      case 'Fahrenheit':
        return 1.0;
      default:
        throw Exception('Unknown imperial unit: $unit');
    }
  }

  double getMetricToImperialConversionFactor(String metricUnit, String imperialUnit) {
    // Convert metric unit to its base unit (meter or gram)
    double baseValue = metricUnit == 'Celsius' ? 1.0 : getMetricConversionFactor(metricUnit);
    // Convert base unit to imperial unit
    double imperialValue = baseValue * getImperialConversionFactor(imperialUnit);
    return imperialValue;
  }
}


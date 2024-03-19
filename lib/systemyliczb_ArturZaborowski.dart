import 'package:flutter/material.dart';

class Systemyliczbowe_ArturZaborowski extends StatelessWidget {
  const Systemyliczbowe_ArturZaborowski({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Systemy Liczbowe'),
      ),
      body: Center(
        child: ElevatedButton(
          style: style,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NumberConverter()), // Przechodzimy do kalkulatora systemów liczbowych
            );
          },
          child: const Text('Przejdź do kalkulatora'),
        ),
      ),
    );
  }
}

class NumberConverter extends StatefulWidget {
  @override
  _NumberConverterState createState() => _NumberConverterState();
}

class _NumberConverterState extends State<NumberConverter> {
  final TextEditingController _binaryController = TextEditingController();
  final TextEditingController _decimalController = TextEditingController();
  final TextEditingController _hexController = TextEditingController();

  void _convertFromBinary(String value) {
    if (value.isEmpty) {
      _clearControllers();
      return;
    }
    int decimal = int.parse(value, radix: 2);
    print('Decimal: $decimal');
    _decimalController.text = decimal.toString();
    print('Hex: ${decimal.toRadixString(16).toUpperCase()}');
    _hexController.text = decimal.toRadixString(16).toUpperCase();
  }

  void _convertFromDecimal(String value) {
    if (value.isEmpty) {
      _clearControllers();
      return;
    }
    int decimal = int.parse(value);
    print('Binary: ${decimal.toRadixString(2)}');
    _binaryController.text = decimal.toRadixString(2);
    print('Hex: ${decimal.toRadixString(16).toUpperCase()}');
    _hexController.text = decimal.toRadixString(16).toUpperCase();
  }

  void _convertFromHex(String value) {
    if (value.isEmpty) {
      _clearControllers();
      return;
    }
    int decimal = int.parse(value, radix: 16);
    print('Binary: ${decimal.toRadixString(2)}');
    _binaryController.text = decimal.toRadixString(2);
    print('Decimal: $decimal');
    _decimalController.text = decimal.toString();
  }

  void _clearControllers() {
    _binaryController.clear();
    _decimalController.clear();
    _hexController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _binaryController,
              decoration: InputDecoration(labelText: 'Binary'),
              keyboardType: TextInputType.number,
              onChanged: _convertFromBinary,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _decimalController,
              decoration: InputDecoration(labelText: 'Decimal'),
              keyboardType: TextInputType.number,
              onChanged: _convertFromDecimal,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _hexController,
              decoration: InputDecoration(labelText: 'Hex'),
              keyboardType: TextInputType.text,
              onChanged: _convertFromHex,
            ),
          ],
        ),
      ),
    );
  }
}

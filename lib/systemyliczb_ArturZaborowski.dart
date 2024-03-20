import 'package:flutter/material.dart';
import 'dart:math';
import 'language.dart';
import 'MartynaLeman.dart';

class NumberConverter extends StatefulWidget {
  @override
  _NumberConverterState createState() => _NumberConverterState();
}

class _NumberConverterState extends State<NumberConverter> {
  final TextEditingController _binaryController = TextEditingController();
  final TextEditingController _decimalController = TextEditingController();
  final TextEditingController _hexController = TextEditingController();
  final TextEditingController _octalController = TextEditingController();
  final TextEditingController _base20Controller = TextEditingController();

  void _convertFromBinary(String value) {
    if (value.isEmpty) {
      _clearControllers();
      return;
    }
    int decimal = int.parse(value, radix: 2);
    _decimalController.text = decimal.toString();
    _hexController.text = decimal.toRadixString(16).toUpperCase();
    _octalController.text = decimal.toRadixString(8);
    _base20Controller.text = _convertToBase20(decimal);
  }

  void _convertFromDecimal(String value) {
    if (value.isEmpty) {
      _clearControllers();
      return;
    }
    int decimal = int.parse(value);
    _binaryController.text = decimal.toRadixString(2);
    _hexController.text = decimal.toRadixString(16).toUpperCase();
    _octalController.text = decimal.toRadixString(8);
    _base20Controller.text = _convertToBase20(decimal);
  }

  void _convertFromHex(String value) {
    if (value.isEmpty) {
      _clearControllers();
      return;
    }
    int decimal = int.parse(value, radix: 16);
    _binaryController.text = decimal.toRadixString(2);
    _decimalController.text = decimal.toString();
    _octalController.text = decimal.toRadixString(8);
    _base20Controller.text = _convertToBase20(decimal);
  }

  void _convertFromOctal(String value) {
    if (value.isEmpty) {
      _clearControllers();
      return;
    }
    int decimal = int.parse(value, radix: 8);
    _binaryController.text = decimal.toRadixString(2);
    _decimalController.text = decimal.toString();
    _hexController.text = decimal.toRadixString(16).toUpperCase();
    _base20Controller.text = _convertToBase20(decimal);
  }

  void _convertFromBase20(String value) {
    if (value.isEmpty) {
      _clearControllers();
      return;
    }
    int decimal = _convertFromBase20ToDecimal(value);
    _binaryController.text = decimal.toRadixString(2);
    _decimalController.text = decimal.toString();
    _hexController.text = decimal.toRadixString(16).toUpperCase();
    _octalController.text = decimal.toRadixString(8);
  }

  String _convertToBase20(int decimal) {
    List<String> base20Symbols = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
    String base20Value = '';
    while (decimal > 0) {
      base20Value = base20Symbols[decimal % 20] + base20Value;
      decimal ~/= 20;
    }
    return base20Value;
  }

  int _convertFromBase20ToDecimal(String value) {
    List<String> base20Symbols = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
    int decimal = 0;
    for (int i = 0; i < value.length; i++) {
      int digit = base20Symbols.indexOf(value[value.length - 1 - i]);
      decimal += digit * pow(20, i).toInt();
    }
    return decimal;
  }

  void _clearControllers() {
    _binaryController.clear();
    _decimalController.clear();
    _hexController.clear();
    _octalController.clear();
    _base20Controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themeslist().themeses[themeIndex],
    home:Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(AppLocalization.getTranslatedValue('Systemy Liczb')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTextField(_binaryController, 'System Binarny'),
            SizedBox(height: 10),
            buildTextField(_decimalController, 'System Decymalny'),
            SizedBox(height: 10),
            buildTextField(_hexController, 'System Szesnastkowy'),
            SizedBox(height: 10),
            buildTextField(_octalController, 'System Ósemkowy'),
            SizedBox(height: 10),
            buildTextField(_base20Controller, 'System Dwudziestkowy'),
          ],
        ),
      ),
    ));

  }

  Widget buildTextField(TextEditingController controller, String labelText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: AppLocalization.getTranslatedValue(labelText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
      ),
      keyboardType: TextInputType.text,
      onChanged: (value) {
        if (labelText == 'System Binarny') {
          _convertFromBinary(value);
        } else if (labelText == 'System Decymalny') {
          _convertFromDecimal(value);
        } else if (labelText == 'System Szesnastkowy') {
          _convertFromHex(value);
        } else if (labelText == 'System Ósemkowy') {
          _convertFromOctal(value);
        } else if (labelText == 'System Dwudziestkowy') {
          _convertFromBase20(value);
        }
      },
    );
  }
}

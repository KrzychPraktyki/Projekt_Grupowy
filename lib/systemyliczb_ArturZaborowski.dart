import 'package:flutter/material.dart';
import 'dart:math';
import 'language.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.getTranslatedValue('Systemy Liczb')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _binaryController,
              decoration: InputDecoration(labelText: AppLocalization.getTranslatedValue('System Binarny')),
              keyboardType: TextInputType.number,
              onChanged: _convertFromBinary,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _decimalController,
              decoration: InputDecoration(labelText: AppLocalization.getTranslatedValue('System Decymalny')),
              keyboardType: TextInputType.number,
              onChanged: _convertFromDecimal,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _hexController,
              decoration: InputDecoration(labelText: AppLocalization.getTranslatedValue('System Szesnastkowy')),
              keyboardType: TextInputType.text,
              onChanged: _convertFromHex,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _octalController,
              decoration: InputDecoration(labelText: AppLocalization.getTranslatedValue('System Ósemkowy')),
              keyboardType: TextInputType.number,
              onChanged: _convertFromOctal,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _base20Controller,
              decoration: InputDecoration(labelText: AppLocalization.getTranslatedValue('System Dwudziestkowy')),
              keyboardType: TextInputType.text,
              onChanged: _convertFromBase20,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class CzwartaStrona extends StatelessWidget {
  const CzwartaStrona({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Przelicznik Jednostek'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('back!'),
        ),
      ),
    );
  }
}

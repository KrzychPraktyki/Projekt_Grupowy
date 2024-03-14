import 'package:flutter/material.dart';
class TrzeciaStrona extends StatelessWidget {
  const TrzeciaStrona({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
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


import 'package:flutter/material.dart';
import 'package:untitled/main.dart';


final TextEditingController _nameController = TextEditingController();

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Login(),

    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatelessWidget {
  const Login({super.key});



@override
Widget build(BuildContext context) {
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));
  return Scaffold(
    appBar: AppBar(
      toolbarHeight: 100,
      title: const Text('Strona Główna'),
    ),
    body: Center(
        child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nazwa Użytkownika',
                  ),
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Hasło',
                  ),
                ),
              ),
              const SizedBox(width: 10),

              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstRoute()),
                  );
                },
                child: const Text('Zaloguj'),
              ),



            ]
        )
    ),
  );
}
}

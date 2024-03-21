import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'language.dart';
import 'MartynaLeman.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _passController = TextEditingController();

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    theme: Themeslist().themeses[themeIndex],
    home: const Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 25),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themeslist().themeses[themeIndex],
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalization.getTranslatedValue('Logowanie')),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nazwa Użytkownika',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passController,
                    decoration: InputDecoration(
                      labelText: 'Hasło',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35,),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    String username = _nameController.text.trim();
                    String password = _passController.text.trim();

                    if (username.isNotEmpty && password.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FirstRoute()),
                      );
                    } else {
                      // Dodaj komunikat lub działanie, jeśli pola są puste
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Błąd'),
                            content: Text('Proszę wypełnić oba pola.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(AppLocalization.getTranslatedValue('Zaloguj')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

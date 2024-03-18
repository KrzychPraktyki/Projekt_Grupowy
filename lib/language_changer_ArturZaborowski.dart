import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChanger extends StatefulWidget {
  final Widget child;
  const LanguageChanger({required this.child, Key? key}) : super(key: key);
  @override
  _LanguageChangerState createState() => _LanguageChangerState();

  static _LanguageChangerState? of(BuildContext context) {
    return context.findAncestorStateOfType<_LanguageChangerState>();
  }
}

class _LanguageChangerState extends State<LanguageChanger> {
  late SharedPreferences _prefs;
  late String _currentLanguage;

  Map<String, Map<String, String>> _translations = {
    'en': {
      'app_title': 'Language Changer',
      'english': 'English',
      'spanish': 'Spanish',
      'russian': 'Russian',
      'chinese': 'Chinese',
      'german': 'German',
      'swedish': 'Swedish',
      'polish': 'Polish',
    },

    'ru': {
      'app_title': 'Смена языка',
      'english': 'Английский',
      'spanish': 'Испанский',
      'russian': 'Русский',
      'chinese': 'Китайский',
      'german': 'Немецкий',
      'swedish': 'Шведский',
      'polish': 'Польский',
    },

    'de': {
      'app_title': 'Sprachwechsler',
      'english': 'Englisch',
      'spanish': 'Spanisch',
      'russian': 'Russisch',
      'chinese': 'Chinesisch',
      'german': 'Deutsch',
      'swedish': 'Schwedisch',
      'polish': 'Polnisch',
    },

    'pl': {
      'app_title': 'Zmiana języka',
      'english': 'Angielski',
      'spanish': 'Hiszpański',
      'russian': 'Rosyjski',
      'chinese': 'Chiński',
      'german': 'Niemiecki',
      'swedish': 'Szwedzki',
      'polish': 'Polski',
    },
  };

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    _currentLanguage = _prefs.getString('language') ?? 'en';
    setState(() {});
  }

  void _changeLanguage(String languageCode) async {
    await _prefs.setString('language', languageCode);
    setState(() {
      _currentLanguage = languageCode;
    });
  }
  @override

  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30));    
    return Scaffold(
      appBar: AppBar(
        title: Text((_translations[_currentLanguage] != null
            ? _translations[_currentLanguage]!['app_title']
            : 'Wybierz język') ?? 'Wybierz język'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: style,
              onPressed: () => _changeLanguage('en'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['English']
                  : 'English') ?? 'English'),
            ),
            const SizedBox(
              height: 20.0,),
            ElevatedButton(
              style: style,
              onPressed: () => _changeLanguage('ru'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['russian']
                  : 'Russian') ?? 'Russian'),
            ),
            const SizedBox(
              height: 20.0,),
            ElevatedButton(
              style: style,
              onPressed: () => _changeLanguage('de'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['german']
                  : 'German') ?? 'German'),
            ),
            const SizedBox(
              height: 20.0,),
            ElevatedButton(
              style: style,
              onPressed: () => _changeLanguage('pl'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['polish']
                  : 'Polish') ?? 'Polish'),
            ),
          ],
        ),
      ),
    );
  }
}

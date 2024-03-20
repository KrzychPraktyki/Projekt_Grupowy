import 'package:intl/intl.dart';

class AppLocalization {
  static String currentLanguage = 'en'; // Default language

  static String getTranslatedValue(String key) {
    // Map your keys to localized strings for each language
    Map<String, Map<String, String>> localizedStrings = {
      'en': {
        "Strona Główna" "Heim" "Дом" : 'Main Page',
        "Ustawienia" "Einstellungen" "Настройки" : 'Settings',
        "Menadżer Zadań" "Taskmanager" "Диспетчер Эадач" : 'Task Manager',
        "System Liczb" "Zahlensysteme" "Системы Счисления" : 'Number Systems',
        "Przelicznik jednostek" "Einheitenumwandler" "Конвертер" : 'Unit Conventer',
        "Kalkulator Kalorii" "Kalorienrechner" "Калькулятор Калорий" : 'Calorie Calculator',
        "Kalkulator Prawdopodobieństwa" "Wahrscheinlichkeitsrechner" "Калькулятор Вероятности" : 'Propability Calculator',
        "Logowanie" "Anmeldung" "Авторизоваться" : 'Log in',
        "Nazwa użytkownika" "Nutzername" "Имя Пользователя" : 'Username',
        "Hasło" "Passwort" "Пароль" : 'Password',
        "Zaloguj" "Anmeldung" "Авторизоваться" : 'Login',
        "Motyw" "Thema" "Тема" : 'Theme',
        "Język" "Zunge" "Язык" : 'Language',
        "Nazwa" "Name" "Имя" : 'Name',
        "Dodaj" "Hinzufügen" "Добавлять" : 'Add',
        "Wszystkie Kalorie" "Alle Kalorien" "Все Калории" : 'All Calories',
      },
      'pl': {
        "Main Page" "Heim" "Дом" : 'Strona Główna',
        "Settings" "Einstellungen" "Настройки" : 'Ustawienia',
        "Task Manager" "Taskmanager" "Диспетчер Эадач" : 'Menadżer Zadań',
        "Number Systems" "Zahlensysteme" "Системы Счисления" : 'System Liczb',
        "Unit Conventer" "Einheitenumwandler" "Конвертер" : 'Przelicznik jednostek',
        "Calorie Calculator" "Kalorienrechner" "Калькулятор Калорий" : 'Kalkulator Kalorii',
        "Propability Calculator" "Wahrscheinlichkeitsrechner" "Калькулятор Вероятности" : 'Kalkulator Prawdopodobieństwa',
        "Log in" "Anmeldung" "Авторизоваться" : 'Logowanie',
        "Username" "Nutzername" "Имя Пользователя" : 'Nazwa użytkownika',
        "Password" "Passwort" "Пароль" : 'Hasło',
        "Login" "Anmeldung" "Авторизоваться" : 'Zaloguj',
        "Theme" "Thema" "Тема" : 'Motyw',
        "Language" "Zunge" "Язык" : 'Język',
        "Name" "Name" "Имя" : 'Nazwa',
        "Add" "Hinzufügen" "Добавлять" : 'Dodaj',
        "All Calories" "Alle Kalorien" "Все Калории" : 'Wszystkie Kalorie',
      },
      'de': {
        "Main Page" "Strona Główna" "Дом" : 'Heim',
        "Settings" "Ustawienia" "Настройки" : 'Einstellungen',
        "Task Manager" "Menadżer Zadań" "Диспетчер Эадач" : 'Taskmanager',
        "Number Systems" "System Liczb" "Системы Счисления" : 'Zahlensysteme',
        "Unit Conventer" "Przelicznik jednostek" "Конвертер" : 'Einheitenumwandler',
        "Calorie Calculator" "Kalkulator Kalorii" "Калькулятор Калорий" : 'Kalorienrechner',
        "Propability Calculator" "Kalkulator Prawdopodobieństwa" "Калькулятор Вероятности" : 'Wahrscheinlichkeitsrechner',
        "Log in" "Logowanie" "Авторизоваться" : 'Anmeldung',
        "Username" "Nazwa użytkownika" "Имя Пользователя" : 'Nutzername',
        "Password" "Hasło" "Пароль" : 'Passwort',
        "Login" "Zaloguj" "Авторизоваться" : 'Anmeldung',
        "Theme" "Motyw" "Тема" : 'Thema',
        "Language" "Język" "Язык" : 'Zunge',
        "Name" "Nazwa" "Имя" : 'Name',
        "Add" "Hinzufügen" "Добавлять" : 'Dodaj',
        "All Calories" "Alle Kalorien" "Все Калории" : 'Wszystkie Kalorie',
      },
      'ru' : {
        "Main Page" "Heim" "Strona Główna" : 'Дом',
        "Settings" "Einstellungen" "Ustawienia" : 'Настройки',
        "Task Manager" "Taskmanager" "Menadżer Zadań" : 'Диспетчер Эадач',
        "Number Systems" "Zahlensysteme" "System Liczb" : 'Системы Счисления',
        "Unit Conventer" "Einheitenumwandler" "Przelicznik jednostek" : 'Конвертер',
        "Calorie Calculator" "Kalorienrechner" "Kalkulator Kalorii" : 'Калькулятор Калорий',
        "Propability Calculator" "Wahrscheinlichkeitsrechner" "Kalkulator Prawdopodobieństwa" : 'Калькулятор Вероятности',
        "Log in" "Anmeldung" "Logowanie" : 'Авторизоваться',
        "Username" "Nutzername" "Nazwa użytkownika" : 'Имя Пользователя',
        "Password" "Passwort" "Hasło" : 'Пароль',
        "Login" "Anmeldung" "Zaloguj" : 'Авторизоваться',
        "Theme" "Thema" "Motyw" : 'Тема',
        "Language" "Zunge" "Język" : 'Язык',
        "Name" "Name" "Имя" : 'Nazwa',
        "Add" "Hinzufügen" "Добавлять" : 'Dodaj',
        "All Calories" "Alle Kalorien" "Все Калории" : 'Wszystkie Kalorie',
      }
    };

    // Return the translated value for the given key
    return localizedStrings[currentLanguage]?[key] ?? key;
  }

  static void changeLanguage(String languageCode) {
    // Change the current language
    currentLanguage = languageCode;
  }
}

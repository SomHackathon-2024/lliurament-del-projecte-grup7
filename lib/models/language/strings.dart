import 'package:flutter/material.dart';

class AppStrings {
  static final Map<String, Map<String, String>> _localizedStrings = {
    'en': {
      'title': 'Home',
      'style': 'Change style',
      'name': 'Name',
      'hintName': 'Introduce your username',
      'password': 'Password',
      'hintPassword': 'Introduce your password',
      'login': 'Login',
      'go_to_display_screen': 'Go to Display Screen',
    },
    'es': {
      'title': 'Inicio',
      'style': 'Cambiar estilo',
      'name': 'Nombre',
      'hintName': 'Introduce tu nombre',
      'password': 'Contraseña',
      'hintPassword': 'Introduce tu contraseña',
      'login': 'Iniciar sesión',
      'go_to_display_screen': 'Ir a la pantalla de visualización',
    },
  };

  /*static String getString(BuildContext context, String key) {
    final locale = Localizations.localeOf(context).languageCode; //not sure if this ?? works
    return _localizedStrings[locale]?[key] ?? _localizedStrings['en']?[key] ?? '';
  }*/
  static String getString(Locale locale, String key) {
    final languageCode = locale.languageCode;
    return _localizedStrings[languageCode]?[key] ?? _localizedStrings['en']?[key] ?? '';
  }

}

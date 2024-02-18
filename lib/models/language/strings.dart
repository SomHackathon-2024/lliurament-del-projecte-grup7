import 'package:flutter/material.dart';

/*
AppStrings.getString(
                  Provider.of<ThemeProvider>(context).locale,
                  'style',
              )
*/

class AppStrings {
  static final Map<String, Map<String, String>> _localizedStrings = {
    'en': {
      'title': 'Home',
      'appName': 'MyMataro',
      'style': 'Change style',
      'name': 'Name',
      'hintName': 'Introduce your username',
      'password': 'Password',
      'hintPassword': 'Introduce your password',
      'login': 'Login',
      'go_to_display_screen': 'Go to Display Screen',
      'leisure': 'Leisure',
      'pet-friendly': 'Pet Friendly',
      'Points': 'Points',
      'Activities': 'Activities',
      'Posts':'Posts',
      'Activities made':'Activities made',
      'Available points':'Available points',
      'Posts made':'Posts made',
      'Rewards':'Rewards',
      'search': 'Search',
      'profile': 'Profile',
    },
    'es': {
      'title': 'Inicio',
      'appName': 'MyMataro',
      'style': 'Cambiar estilo',
      'name': 'Nombre',
      'hintName': 'Introduce tu nombre',
      'password': 'Contraseña',
      'hintPassword': 'Introduce tu contraseña',
      'login': 'Iniciar sesión',
      'go_to_display_screen': 'Ir a la pantalla de visualización',
      'leisure': 'Oci',
      'pet-friendly': 'Aceptan mascotas',
      'Rewards':'Recompensas',
      'Points': 'Puntos',
      'Activities': 'Actividades',
      'Posts':'Publicaciones',
      'Activities made':'Actividades realizadas',
      'Available points':'Puntos disponibles',
      'Posts made':'Publicaciones hechas',
      'search': 'Busqueda',
      'profile': 'Perfil',

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

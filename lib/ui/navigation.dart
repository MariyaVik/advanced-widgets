import 'package:flutter/material.dart';

import 'home.dart';
import 'setting_screen.dart';

abstract class NavRouteName {
  static const home = '/';
  static const settings = '/settings';
}

class Navigation {
  static const initialRoute = NavRouteName.home;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavRouteName.home:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(title: 'Weather'));
      case NavRouteName.settings:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Text('Navigation error!!!'));
    }
  }
}

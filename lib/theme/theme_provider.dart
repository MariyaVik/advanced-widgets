import 'package:flutter/material.dart';

import 'color_palettes.dart';
import 'themes.dart';

class StateThemeWidget extends StatefulWidget {
  final Widget child;
  const StateThemeWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<StateThemeWidget> createState() => _StateThemeWidgetState();
}

class _StateThemeWidgetState extends State<StateThemeWidget> {
  ThemeData theme = browmTheme;

  void changeTheme(String themeName) {
    theme = colorPalettes[themeName]!['theme'] as ThemeData; // ?? browmTheme;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      theme: theme,
      stateWidget: this,
      child: widget.child,
    );
  }
}

class ThemeProvider extends InheritedWidget {
  final ThemeData theme; // = browmTheme;
  final _StateThemeWidgetState stateWidget;
  const ThemeProvider({
    Key? key,
    required Widget child,
    required this.theme,
    required this.stateWidget,
  }) : super(key: key, child: child);

  static _StateThemeWidgetState of(BuildContext context) {
    var result = context
        .dependOnInheritedWidgetOfExactType<ThemeProvider>()!
        .stateWidget;
    return result;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return theme != oldWidget.theme;
  }
}

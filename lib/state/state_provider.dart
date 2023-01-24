import 'dart:math';

import 'package:flutter/material.dart';

import '../ui/theme/color_palettes.dart';
import '../ui/theme/themes.dart';

class StateWidget extends StatefulWidget {
  final Widget child;
  const StateWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  ThemeData theme = browmTheme;
  double weatherCoef = 0.2;

  void changeTheme(String themeName) {
    theme = colorPalettes[themeName]!['theme'] as ThemeData;
    setState(() {});
  }

  void updateWeather() {
    weatherCoef = Random().nextDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      theme: theme,
      weatherCoef: weatherCoef,
      stateWidget: this,
      child: widget.child,
    );
  }
}

class StateProvider extends InheritedWidget {
  final ThemeData theme; // = browmTheme;
  final double weatherCoef;
  final _StateWidgetState stateWidget;
  const StateProvider(
      {Key? key,
      required Widget child,
      required this.theme,
      required this.stateWidget,
      required this.weatherCoef})
      : super(key: key, child: child);

  static _StateWidgetState of(BuildContext context) {
    var result = context
        .dependOnInheritedWidgetOfExactType<StateProvider>()!
        .stateWidget;
    return result;
  }

  @override
  bool updateShouldNotify(StateProvider oldWidget) {
    return theme != oldWidget.theme || weatherCoef != oldWidget.weatherCoef;
  }
}

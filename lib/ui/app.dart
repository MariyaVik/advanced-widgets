import 'package:flutter/material.dart';
import 'package:skillbox_14_6/state/state_provider.dart';
import 'package:skillbox_14_6/ui/navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: StateProvider.of(context).theme,
          initialRoute: NavRouteName.home,
          onGenerateRoute: Navigation.onGenerateRoute,
        );
      }),
    );
  }
}

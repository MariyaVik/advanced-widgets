import 'package:flutter/material.dart';
import 'package:skillbox_14_6/ui/navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: NavRouteName.home,
      onGenerateRoute: Navigation.onGenerateRoute,
    );
  }
}

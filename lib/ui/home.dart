import 'package:flutter/material.dart';
import '../state/state_provider.dart';
import 'navigation.dart';
import 'widgets/weather_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NavRouteName.settings);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: const WeatherWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: StateProvider.of(context).updateWeater,
        child: const Icon(Icons.update),
      ),
    );
  }
}

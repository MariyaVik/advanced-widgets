import 'package:flutter/material.dart';
import 'package:skillbox_14_6/ui/theme/color_palettes.dart';
import 'package:skillbox_14_6/state/state_provider.dart';

import '../widgets/custom_widgets/colors_circle.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          String themeName = colorPalettes.keys.toList()[index];
          return ListTile(
            onTap: () => StateProvider.of(context).changeTheme(themeName),
            leading: SizedBox(
                height: 40,
                width: 40,
                child: CustomPaint(
                    painter: ColorsCircleWidget(
                        colorPalette: colorPalettes.values.toList()[index]
                            ['palette']))),
            title: Text(themeName),
            selected: StateProvider.of(context).theme ==
                colorPalettes[themeName]!['theme'],
          );
        },
        itemCount: 3,
      ),
    );
  }
}

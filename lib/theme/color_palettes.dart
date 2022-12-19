import 'package:flutter/material.dart';

import 'themes.dart';

abstract class Brown {
  static const Color white = Color(0xFFF5F6ED);
  static const Color beige = Color(0xFFD5AA72);
  static const Color brownLigth = Color(0xFFA66A2C);
  static const Color brownDark = Color(0xFF4C2818);
  static const Color black = Color(0xFF131410);
  static const Color errorColor = Color(0xFF790000);
  static List<Color> get colors => [white, beige, brownLigth, brownDark, black];
}

abstract class Purple {
  static const Color cream = Color(0xFFdecbc3);
  static const Color white = Color(0xFFe6e1dd);
  static const Color purpleLight = Color(0xFFc9abc3);
  static const Color purple = Color(0xFF864d7f);
  static const Color purpleDark = Color(0xFF4e1e4a);
  static const Color errorColor = Color(0xFF790000);
  static const Color black = Color(0xFF131410);
  static List<Color> get colors =>
      [cream, white, purpleLight, purple, purpleDark];
}

abstract class Colorful {
  static const Color pink = Color(0xFFF78A8F);
  static const Color white = Color(0xFFF3F7FA);
  static const Color yellow = Color(0xFFFFD802);
  static const Color blueLight = Color(0xFF024D8C);
  static const Color blueDark = Color(0xFF002357);
  static const Color errorColor = Color(0xFF790000);
  static List<Color> get colors => [pink, white, yellow, blueLight, blueDark];
}

var colorPalettes = {
  'Brown': {'palette': Brown.colors, 'theme': browmTheme},
  'Purple': {'palette': Purple.colors, 'theme': purpleTheme},
  'Colorful': {'palette': Colorful.colors, 'theme': colorfulTheme}
};

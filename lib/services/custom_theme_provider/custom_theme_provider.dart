import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Typography {
  static TextStyle appFont = GoogleFonts.varelaRound();
  final TextStyle cardText = TextStyle(
    fontSize: 20,
    color: Color(0xFFF8F8F8),
    fontFamily: appFont.fontFamily,
  );
  final TextStyle highLightText = TextStyle(
    fontSize: 14,
    color: Color(0xFFF8F8F8),
    fontFamily: appFont.fontFamily,
  );
  final TextStyle disabledText = TextStyle(
    fontSize: 14,
    color: Colors.grey,
    fontFamily: appFont.fontFamily,
  );
}

class CustomThemeData {
  final Color cardBackgroundColor = const Color(0xFFFFC641);
  final Color displayBlockColor = const Color(0xFFffff7f);
  final Color appBackgroundColor = const Color(0xFF292621);
  final Color disabledColor = Colors.grey;
  final Typography typo = Typography();
  static Duration defaultAnimationDuration = Duration(milliseconds: 800);
}

class ThemeNotifier with ChangeNotifier implements ReassembleHandler {
  CustomThemeData _themeData = CustomThemeData();
  ThemeNotifier(this._themeData);
  CustomThemeData currentTheme() => _themeData;
  setTheme(CustomThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  @override
  void reassemble() {
    setTheme(CustomThemeData());
  }
}

mixin CustomThemeMixin {
  ThemeNotifier themeDisplayFor(BuildContext context) {
    return Provider.of<ThemeNotifier>(context, listen: true);
  }

  ThemeNotifier themeControllerFor(BuildContext context) {
    return Provider.of<ThemeNotifier>(context, listen: false);
  }
}

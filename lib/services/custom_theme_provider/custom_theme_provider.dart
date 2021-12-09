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
}

class CustomThemeData {
  final Color cardBackgroundColor = const Color(0xFFFFC641);
  final Color appBackgroundColor = const Color(0xFF292621);
  final Typography typo = Typography();
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

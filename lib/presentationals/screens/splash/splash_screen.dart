import 'package:flutter/material.dart';
import 'package:flutter_yugioh_2021/services/service_index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with CustomThemeMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeDisplayFor(context).currentTheme().cardBackgroundColor,
      child: TextButton(
        child: const Text('changed me with provider!!!'),
        onPressed: () {},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_yugioh_2021/presentationals/screens/screen_index.dart';
import 'package:flutter_yugioh_2021/routes/routes.dart';
import 'package:flutter_yugioh_2021/services/service_index.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceFacade.registerDefaultService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(CustomThemeData()),
      child: MaterialApp(
        initialRoute: './',
        routes: Routes.routes(),
        title: 'Flutter Demo',
        // home: MainScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../services/service_index.dart';
import '../../presentional_index.dart';
import 'main_screen_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with CustomThemeMixin {
  final mainScreenBloc = MainScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          themeDisplayFor(context).currentTheme().appBackgroundColor,
      body: StreamBuilder<List<CardInfoOnVerticalListModel>>(
        stream: mainScreenBloc.observeAllcardsChange(),
        builder: (context, snapshot) {
          final List<CardInfoOnVerticalListModel> concreteData =
              snapshot.data ?? [];
          return ListVerticalCardsWidget(
            cardsDisplay: concreteData,
          );
        },
      ),
    );
  }
}

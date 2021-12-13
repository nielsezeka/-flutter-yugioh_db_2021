import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yugioh_2021/routes/routes.dart';
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
        builder: (localContext, snapshot) {
          final List<CardInfoOnVerticalListModel> concreteData =
              snapshot.data ?? [];
          if (concreteData.length == 0) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          }
          return ListVerticalCardsWidget(
            cardsDisplay: concreteData,
            onPressed: (itemPresses) {
              mainScreenBloc.onFocusCardData(itemPresses.cardIndentifier);
              Navigator.of(context).pushNamed(Routes.detailCard);
            },
          );
        },
      ),
    );
  }
}

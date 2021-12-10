import 'package:flutter/material.dart';
import 'package:flutter_yugioh_2021/bloc/bloc_index.dart';
import 'package:flutter_yugioh_2021/services/yugioh_db_service/response_model/all_card_response_model.dart';

import '../../../services/service_index.dart';

class DetailOfCard extends StatelessWidget with CustomThemeMixin {
  const DetailOfCard({Key? key, required this.idOfItem}) : super(key: key);
  final String idOfItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<CardData>(
          stream: GlobalBloc.appStateBloc.cardToShow(),
          builder: (context, snapshot) {
            CardData? cardData = snapshot.data;
            if (cardData != null) {
              print('imageHero${cardData.id.toString()}');
              return Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.red,
                  )),
                  Expanded(
                    child: Hero(
                      tag: 'imageHero${cardData.id.toString()}',
                      child: Container(
                        color: themeDisplayFor(context)
                            .currentTheme()
                            .cardBackgroundColor,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}

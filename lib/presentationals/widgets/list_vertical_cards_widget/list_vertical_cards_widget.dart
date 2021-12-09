import 'package:flutter/material.dart';
import 'package:flutter_yugioh_2021/services/custom_theme_provider/custom_theme_provider.dart';

import '../../presentional_index.dart';

class CardInfoOnVerticalListModel {
  final String cardName;
  final String cardImage;
  final String cardIndentifier;
  final String cardText;

  CardInfoOnVerticalListModel({
    required this.cardName,
    required this.cardImage,
    required this.cardIndentifier,
    required this.cardText,
  });
}

class ListVerticalCardsWidget extends StatefulWidget {
  final List<CardInfoOnVerticalListModel> cardsDisplay;
  const ListVerticalCardsWidget({
    Key? key,
    required this.cardsDisplay,
  }) : super(key: key);

  @override
  _ListVerticalCardsWidgetState createState() =>
      _ListVerticalCardsWidgetState();
}

class _ListVerticalCardsWidgetState extends State<ListVerticalCardsWidget>
    with CustomThemeMixin {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: ThumnailCard(
              cardName: widget.cardsDisplay[index].cardName,
              imageLink: widget.cardsDisplay[index].cardImage,
              cardDeciption: widget.cardsDisplay[index].cardText,
            ),
          ),
        );
      },
      itemCount: widget.cardsDisplay.length,
    );
  }
}

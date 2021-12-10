import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yugioh_2021/routes/routes.dart';
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
    this.onPressed,
  }) : super(key: key);
  final ValueChanged<CardInfoOnVerticalListModel>? onPressed;
  @override
  _ListVerticalCardsWidgetState createState() =>
      _ListVerticalCardsWidgetState();
}

class _ListVerticalCardsWidgetState extends State<ListVerticalCardsWidget>
    with CustomThemeMixin {
  bool isRenderWithHero = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CupertinoButton(
          onPressed: () {
            if (widget.onPressed != null) {
              setState(() {
                isRenderWithHero = true;
              });
              widget.onPressed!(widget.cardsDisplay[index]);
            }
          },
          child: isRenderWithHero
              ? _renderWithHero(index)
              : _renderNormally(index),
        );
      },
      itemCount: widget.cardsDisplay.length,
    );
  }

  Widget _renderWithHero(int index) {
    print('before imageHero${widget.cardsDisplay[index].cardIndentifier}');
    return Hero(
      tag: 'imageHero${widget.cardsDisplay[index].cardIndentifier}',
      child: _renderNormally(index),
    );
  }

  Widget _renderNormally(int index) {
    return Container(
      color: themeDisplayFor(context).currentTheme().cardBackgroundColor,
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
  }
}

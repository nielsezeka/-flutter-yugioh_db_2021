import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../services/service_index.dart';

class ThumnailCard extends StatelessWidget with CustomThemeMixin {
  const ThumnailCard({
    Key? key,
    required this.imageLink,
    required this.cardName,
    required this.cardDeciption,
  }) : super(key: key);
  final String imageLink;
  final String cardName;
  final String cardDeciption;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (
      context,
      boxConstraints,
    ) {
      final haftSizeWidth = boxConstraints.maxWidth / 2;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: CachedNetworkImage(
                    width: haftSizeWidth,
                    fadeInDuration: const Duration(milliseconds: 300),
                    imageUrl: imageLink,
                    placeholder: (context, link) => Image.asset(
                      'assets/default_icon/card_back.jpg',
                      fit: BoxFit.cover,
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      cardName.toUpperCase(),
                      style:
                          themeDisplayFor(context).currentTheme().typo.cardText,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      cardDeciption,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../services/service_index.dart';

class ThumnailCard extends StatelessWidget with CustomThemeMixin {
  const ThumnailCard({
    Key? key,
    required this.imageLink,
    required this.cardName,
    required this.cardDeciption,
    this.heigh,
  }) : super(key: key);
  final String imageLink;
  final String cardName;
  final String cardDeciption;
  final double? heigh;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (
      context,
      boxConstraints,
    ) {
      return Align(
        alignment: Alignment.topCenter,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(10),
          height: 300,
          width: double.infinity,
          child: OverflowBox(
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: imageLink,
                      placeholder: (context, url) =>
                          Image.asset('assets/default_icon/card_back.jpg'),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          cardName.toUpperCase(),
                          style: themeDisplayFor(context)
                              .currentTheme()
                              .typo
                              .cardText,
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
          ),
        ),
      );
    });
  }
}

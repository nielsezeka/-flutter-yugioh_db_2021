import 'package:flutter/material.dart';
import 'package:flutter_yugioh_2021/presentationals/presentional_index.dart';

import '../presentationals/screens/screen_index.dart';

class Routes {
  static String detailCard = 'detailCard';
  static Map<String, WidgetBuilder> routes() {
    return {
      './': (context) => const MainScreen(),
      Routes.detailCard: (context) => const DetailOfCard(
            idOfItem: '3',
          ),
    };
  }
}

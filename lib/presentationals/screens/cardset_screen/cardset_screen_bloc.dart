import 'package:flutter_yugioh_2021/services/service_index.dart';
import '../../presentional_index.dart';
import 'package:rxdart/rxdart.dart';

class CardSetScreenBloc {
  final databaseService = ServiceFacade.getService<YugiohService>();

  Stream<List<ListVerticalCardSetModel>> observeArcheType() {
    return databaseService.observeCardSet().switchMap(
          (value) => Stream.value(
            value
                .map(
                  (e) => ListVerticalCardSetModel(
                    packName: e.setInfo.setName ?? '',
                    releaseDate: e.setInfo.tcgDate,
                    images: e.cards
                        .map((info) => info.cardImages?.first.imageUrlSmall)
                        .whereType<String>()
                        .toList(),
                    totalCards: e.cards.length,
                    idCardSet: e.setInfo.setName ?? '',
                  ),
                )
                .toList(),
          ),
        );
  }
}

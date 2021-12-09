import 'package:flutter_yugioh_2021/services/service_facade.dart';
import 'package:flutter_yugioh_2021/services/service_index.dart';
import 'package:rxdart/rxdart.dart';

import '../../presentional_index.dart';

class MainScreenBloc {
  final databaseService = ServiceFacade.getService<YugiohService>();
  Stream<List<CardInfoOnVerticalListModel>> observeAllcardsChange() {
    return databaseService.observerAllCardInformation().switchMap(
          (value) => Stream.value(
            value.data
                    ?.map(
                      (cardFromServer) => CardInfoOnVerticalListModel(
                          cardImage:
                              cardFromServer.cardImages?.first.imageUrl ?? '',
                          cardIndentifier: cardFromServer.id.toString(),
                          cardName: cardFromServer.name ?? '',
                          cardText: ' '),
                    )
                    .toList() ??
                [],
          ),
        );
  }
}

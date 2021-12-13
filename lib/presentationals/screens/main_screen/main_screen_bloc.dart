import 'package:flutter_yugioh_2021/bloc/bloc_index.dart';
import 'package:flutter_yugioh_2021/services/service_index.dart';
import 'package:rxdart/rxdart.dart';

import '../../presentional_index.dart';

class MainScreenBloc {
  final databaseService = ServiceFacade.getService<YugiohService>();
  MainScreenBloc() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        databaseService.getAllCard();
      },
    );
  }
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

  onFocusCardData(String originalID) {
    databaseService
        .observerAllCardInformation()
        .switchMap(
          (value) => Stream.value(
            value.data?.firstWhere(
              (element) => element.id.toString() == originalID,
            ),
          ),
        )
        .listen((cardToObserve) {
      if (cardToObserve != null) {
        GlobalBloc.appStateBloc.acceptCard(cardToObserve);
      }
    });
  }
}

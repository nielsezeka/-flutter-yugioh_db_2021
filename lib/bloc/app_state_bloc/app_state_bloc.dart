import 'package:flutter_yugioh_2021/services/yugioh_db_service/response_model/all_card_response_model.dart';
import 'package:rxdart/subjects.dart';

class AppStateBloc {
  BehaviorSubject<CardData> _currentCard = BehaviorSubject<CardData>();
  acceptCard(CardData newData) {
    _currentCard.add(newData);
  }

  Stream<CardData> cardToShow() {
    return _currentCard.stream;
  }
}

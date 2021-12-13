import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:async';
import './response_model/all_card_response_model.dart';
import 'package:http/retry.dart';

class YugiohService {
  final client = RetryClient(http.Client());
  final linkToGetAllCards = 'https://db.ygoprodeck.com/api/v7/cardinfo.php';
  final BehaviorSubject<AllCardResponseModel> _allCards =
      BehaviorSubject<AllCardResponseModel>.seeded(
          AllCardResponseModel(data: []));
  YugiohService() {}
  Future<void> getAllCard() async {
    try {
      var response = await client.get(Uri.parse(linkToGetAllCards));
      final result = await compute(parseResult, response.body);
      _allCards.add(result);
      final allset = await compute(findAllCardSet, result);
      print('founding... ${allset.length}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Stream<AllCardResponseModel> observerAllCardInformation() {
    return _allCards.stream;
  }

  dispose() {
    _allCards.close();
  }
}

AllCardResponseModel parseResult(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return AllCardResponseModel.fromJson(parsed);
}

Set<String> findAllCardSet(AllCardResponseModel responseModel) {
  if (responseModel.data == null) {
    return <String>{};
  }

  // list input not null, we can safety access it
  return responseModel.data!
      .map((e) => e.cardSets?.map((setCard) => setCard.setName))
      .expand((element) => element?.whereType<String>().toList() ?? [])
      .whereType<String>()
      .toSet();
}

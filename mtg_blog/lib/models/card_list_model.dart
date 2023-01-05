import 'dart:convert';

import 'card_model.dart';

CardList cardListFromJson(String str) => CardList.fromJson(json.decode(str));

String cardListToJson(CardList data) => json.encode(data.toJson());

class CardList {
  CardList({
    required this.cards,
  });

  List<Card> cards;

  factory CardList.fromJson(Map<String, dynamic> json) => CardList(
        cards: List<Card>.from(json["cards"].map((x) => Card.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cards": List<dynamic>.from(cards.map((x) => x.toJson())),
      };
}

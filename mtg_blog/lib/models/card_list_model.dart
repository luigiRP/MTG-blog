import 'dart:convert';

import 'card_model.dart';

CardList cardListFromJson(String str) => CardList.fromJson(json.decode(str));

String cardListToJson(CardList data) => json.encode(data.toJson());

class CardList {
  CardList({
    required this.cards,
  });

  List<MTGCard> cards;

  factory CardList.fromJson(Map<String, dynamic> json) => CardList(
        cards:
            List<MTGCard>.from(json["cards"].map((x) => MTGCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cards": List<dynamic>.from(cards.map((x) => x.toJson())),
      };
}

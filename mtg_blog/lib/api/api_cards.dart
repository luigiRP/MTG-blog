import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mtg_blog/models/card_list_model.dart';

class CardAPI {
  static Future<CardList> getCards() async {
    final res =
        await http.get(Uri.parse('https://api.magicthegathering.io/v1/cards'));

    return CardList.fromJson(jsonDecode(res.body));
  }
}

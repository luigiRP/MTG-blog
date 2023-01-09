import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mtg_blog/models/card_list_model.dart';

class CardAPI {
  static Future<Map<String, dynamic>> getCards() async {
    final res =
        await http.get(Uri.parse('https://api.magicthegathering.io/v1/cards'));

    return {
      "cards": CardList.fromJson(jsonDecode(res.body)),
      "status_code": res.statusCode
    };
  }
}

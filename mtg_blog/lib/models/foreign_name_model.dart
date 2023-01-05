import 'package:mtg_blog/models/card_model.dart';

import 'card_list_model.dart';

class ForeignName {
  ForeignName({
    required this.name,
    required this.text,
    required this.type,
    required this.flavor,
    required this.imageUrl,
    required this.language,
    required this.multiverseid,
  });

  String name;
  String text;
  String type;
  String? flavor;
  String imageUrl;
  Language language;
  int multiverseid;

  factory ForeignName.fromJson(Map<String, dynamic> json) => ForeignName(
        name: json["name"],
        text: json["text"],
        type: json["type"],
        flavor: json["flavor"],
        imageUrl: json["imageUrl"],
        language: languageValues.map[json["language"]]!,
        multiverseid: json["multiverseid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "text": text,
        "type": type,
        "flavor": flavor,
        "imageUrl": imageUrl,
        "language": languageValues.reverse?[language],
        "multiverseid": multiverseid,
      };
}

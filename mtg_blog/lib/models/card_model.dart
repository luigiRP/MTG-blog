import 'package:mtg_blog/models/foreign_name_model.dart';
import 'package:mtg_blog/models/legality_element_model.dart';
import 'package:mtg_blog/models/ruling_model.dart';

class Card {
  Card({
    required this.name,
    required this.manaCost,
    required this.cmc,
    required this.colors,
    required this.colorIdentity,
    required this.type,
    required this.types,
    this.subtypes,
    required this.rarity,
    required this.cardSet,
    required this.setName,
    required this.text,
    required this.artist,
    required this.number,
    this.power,
    this.toughness,
    required this.layout,
    required this.multiverseid,
    required this.imageUrl,
    required this.variations,
    required this.foreignNames,
    required this.printings,
    required this.originalText,
    required this.originalType,
    required this.legalities,
    required this.id,
    required this.flavor,
    required this.rulings,
    required this.supertypes,
  });

  String name;
  String manaCost;
  double cmc;
  List<Color> colors;
  List<Color> colorIdentity;
  String type;
  List<Type> types;
  List<String>? subtypes;
  Rarity rarity;
  Set cardSet;
  SetName setName;
  String text;
  String artist;
  String number;
  String? power;
  String? toughness;
  Layout layout;
  String? multiverseid;
  String? imageUrl;
  List<String>? variations;
  List<ForeignName>? foreignNames;
  List<String> printings;
  String? originalText;
  String? originalType;
  List<LegalityElement> legalities;
  String id;
  String? flavor;
  List<Ruling>? rulings;
  List<String>? supertypes;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        name: json["name"],
        manaCost: json["manaCost"],
        cmc: json["cmc"],
        colors: List<Color>.from(json["colors"].map((x) => colorValues.map[x])),
        colorIdentity: List<Color>.from(
            json["colorIdentity"].map((x) => colorValues.map[x])),
        type: json["type"],
        types: List<Type>.from(json["types"].map((x) => typeValues.map[x])),
        subtypes: json["subtypes"] == null
            ? null
            : List<String>.from(json["subtypes"].map((x) => x)),
        rarity: rarityValues.map[json["rarity"]]!,
        cardSet: setValues.map[json["set"]]!,
        setName: setNameValues.map[json["setName"]]!,
        text: json["text"],
        artist: json["artist"],
        number: json["number"],
        power: json["power"],
        toughness: json["toughness"],
        layout: layoutValues.map[json["layout"]]!,
        multiverseid: json["multiverseid"],
        imageUrl: json["imageUrl"],
        variations: json["variations"] == null
            ? null
            : List<String>.from(json["variations"].map((x) => x)),
        foreignNames: json["foreignNames"] == null
            ? null
            : List<ForeignName>.from(
                json["foreignNames"].map((x) => ForeignName.fromJson(x))),
        printings: List<String>.from(json["printings"].map((x) => x)),
        originalText: json["originalText"],
        originalType: json["originalType"],
        legalities: List<LegalityElement>.from(
            json["legalities"].map((x) => LegalityElement.fromJson(x))),
        id: json["id"],
        flavor: json["flavor"],
        rulings: json["rulings"] == null
            ? null
            : List<Ruling>.from(json["rulings"].map((x) => Ruling.fromJson(x))),
        supertypes: json["supertypes"] == null
            ? null
            : List<String>.from(json["supertypes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "manaCost": manaCost,
        "cmc": cmc,
        "colors":
            List<dynamic>.from(colors.map((x) => colorValues.reverse?[x])),
        "colorIdentity": List<dynamic>.from(
            colorIdentity.map((x) => colorValues.reverse?[x])),
        "type": type,
        "types": List<dynamic>.from(types.map((x) => typeValues.reverse?[x])),
        "subtypes": subtypes == null
            ? null
            : List<dynamic>.from(subtypes!.map((x) => x)),
        "rarity": rarityValues.reverse?[rarity],
        "set": setValues.reverse?[cardSet],
        "setName": setNameValues.reverse?[setName],
        "text": text,
        "artist": artist,
        "number": number,
        "power": power,
        "toughness": toughness,
        "layout": layoutValues.reverse?[layout],
        "multiverseid": multiverseid,
        "imageUrl": imageUrl,
        "variations": variations == null
            ? null
            : List<dynamic>.from(variations!.map((x) => x)),
        "foreignNames": foreignNames == null
            ? null
            : List<dynamic>.from(foreignNames!.map((x) => x.toJson())),
        "printings": List<dynamic>.from(printings.map((x) => x)),
        "originalText": originalText,
        "originalType": originalType,
        "legalities": List<dynamic>.from(legalities.map((x) => x.toJson())),
        "id": id,
        "flavor": flavor,
        "rulings": rulings == null
            ? null
            : List<dynamic>.from(rulings!.map((x) => x.toJson())),
        "supertypes": supertypes == null
            ? null
            : List<dynamic>.from(supertypes!.map((x) => x)),
      };
}

enum Set { the10E }

final setValues = EnumValues({"10E": Set.the10E});

enum Color { W, U }

final colorValues = EnumValues({"U": Color.U, "W": Color.W});

enum Layout { normal }

final layoutValues = EnumValues({"normal": Layout.normal});

enum Language {
  german,
  spanish,
  french,
  italian,
  japanese,
  portugueseBrazil,
  russian,
  chineseSimplified
}

final languageValues = EnumValues({
  "Chinese Simplified": Language.chineseSimplified,
  "French": Language.french,
  "German": Language.german,
  "Italian": Language.italian,
  "Japanese": Language.japanese,
  "Portuguese (Brazil)": Language.portugueseBrazil,
  "Russian": Language.russian,
  "Spanish": Language.spanish
});

enum Rarity { uncommon, common, rare }

final rarityValues = EnumValues({
  "Common": Rarity.common,
  "Rare": Rarity.rare,
  "Uncommon": Rarity.uncommon
});

enum SetName { tenthEdition }

final setNameValues = EnumValues({"Tenth Edition": SetName.tenthEdition});

enum Type { creature, sorcery, enchantment, instant }

final typeValues = EnumValues({
  "Creature": Type.creature,
  "Enchantment": Type.enchantment,
  "Instant": Type.instant,
  "Sorcery": Type.sorcery
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

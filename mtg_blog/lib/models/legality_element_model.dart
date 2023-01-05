import 'card_list_model.dart';
import 'card_model.dart';

class LegalityElement {
  LegalityElement({
    required this.format,
    required this.legality,
  });

  Format format;
  LegalityEnum legality;

  factory LegalityElement.fromJson(Map<String, dynamic> json) =>
      LegalityElement(
        format: formatValues.map[json["format"]]!,
        legality: legalityEnumValues.map[json["legality"]]!,
      );

  Map<String, dynamic> toJson() => {
        "format": formatValues.reverse?[format],
        "legality": legalityEnumValues.reverse?[legality],
      };
}

enum Format {
  commander,
  duel,
  legacy,
  modern,
  pauperCommander,
  penny,
  premodern,
  vintage,
  gladiator,
  historic,
  historicBrawl,
  pauper,
  pioneer,
  explorer,
  alchemy
}

final formatValues = EnumValues({
  "Alchemy": Format.alchemy,
  "Commander": Format.commander,
  "Duel": Format.duel,
  "Explorer": Format.explorer,
  "Gladiator": Format.gladiator,
  "Historic": Format.historic,
  "Historicbrawl": Format.historicBrawl,
  "Legacy": Format.legacy,
  "Modern": Format.modern,
  "Pauper": Format.pauper,
  "Paupercommander": Format.pauperCommander,
  "Penny": Format.penny,
  "Pioneer": Format.pioneer,
  "Premodern": Format.premodern,
  "Vintage": Format.vintage
});

enum LegalityEnum { legal, restricted }

final legalityEnumValues = EnumValues(
    {"Legal": LegalityEnum.legal, "Restricted": LegalityEnum.restricted});

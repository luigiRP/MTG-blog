class Ruling {
  Ruling({
    required this.date,
    required this.text,
  });

  DateTime date;
  String text;

  factory Ruling.fromJson(Map<String, dynamic> json) => Ruling(
        date: DateTime.parse(json["date"]),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "text": text,
      };
}

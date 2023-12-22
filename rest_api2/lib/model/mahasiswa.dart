import 'dart:convert';

Mahsiswa mahsiswaFromJson(String str) => Mahsiswa.fromJson(json.decode(str));

String mahsiswaToJson(Mahsiswa data) => json.encode(data.toJson());

class Mahsiswa {
  Data data;
  Support support;

  Mahsiswa({
    required this.data,
    required this.support,
  });

  factory Mahsiswa.fromJson(Map<String, dynamic> json) => Mahsiswa(
        data: Data.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
      );
  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "support": support.toJson(),
      };
}

class Data {
  int id;
  String name;
  int year;
  String color;
  String pantoneValue;

  Data({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        color: json["color"],
        pantoneValue: json["pantone_value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "year": year,
        "color": color,
        "pantone_value": pantoneValue,
      };
}

class Support {
  String url;
  String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}

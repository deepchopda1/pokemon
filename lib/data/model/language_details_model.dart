import 'dart:convert';

LanguageDetail languageDetailFromJson(String str) =>
    LanguageDetail.fromJson(json.decode(str));

String languageDetailToJson(LanguageDetail data) => json.encode(data.toJson());

class LanguageDetail {
  int? id;
  String? iso3166;
  String? iso639;
  String? name;
  List<Name>? names;
  bool? official;

  LanguageDetail({
    this.id,
    this.iso3166,
    this.iso639,
    this.name,
    this.names,
    this.official,
  });

  LanguageDetail copyWith({
    int? id,
    String? iso3166,
    String? iso639,
    String? name,
    List<Name>? names,
    bool? official,
  }) =>
      LanguageDetail(
        id: id ?? this.id,
        iso3166: iso3166 ?? this.iso3166,
        iso639: iso639 ?? this.iso639,
        name: name ?? this.name,
        names: names ?? this.names,
        official: official ?? this.official,
      );

  factory LanguageDetail.fromJson(Map<String, dynamic> json) => LanguageDetail(
        id: json["id"],
        iso3166: json["iso3166"],
        iso639: json["iso639"],
        name: json["name"],
        names: json["names"] == null
            ? []
            : List<Name>.from(json["names"]!.map((x) => Name.fromJson(x))),
        official: json["official"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iso3166": iso3166,
        "iso639": iso639,
        "name": name,
        "names": names == null
            ? []
            : List<dynamic>.from(names!.map((x) => x.toJson())),
        "official": official,
      };
}

class Name {
  Language? language;
  String? name;

  Name({
    this.language,
    this.name,
  });

  Name copyWith({
    Language? language,
    String? name,
  }) =>
      Name(
        language: language ?? this.language,
        name: name ?? this.name,
      );

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null
            ? null
            : Language.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language?.toJson(),
        "name": name,
      };
}

class Language {
  String? name;
  String? url;

  Language({
    this.name,
    this.url,
  });

  Language copyWith({
    String? name,
    String? url,
  }) =>
      Language(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

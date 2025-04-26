// To parse this JSON data, do
//
//     final abilityList = abilityListFromJson(jsonString);

import 'dart:convert';

AbilityList abilityListFromJson(String str) =>
    AbilityList.fromJson(json.decode(str));

String abilityListToJson(AbilityList data) => json.encode(data.toJson());

class AbilityList {
  int? count;
  String? next;
  String? previous;
  List<Result>? results;

  AbilityList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  AbilityList copyWith({
    int? count,
    String? next,
    String? previous,
    List<Result>? results,
  }) =>
      AbilityList(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  factory AbilityList.fromJson(Map<String, dynamic> json) => AbilityList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? name;
  String? url;

  Result({
    this.name,
    this.url,
  });

  Result copyWith({
    String? name,
    String? url,
  }) =>
      Result(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

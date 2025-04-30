import 'dart:convert';

EvolutionChainItem evolutionChainItemFromJson(String str) =>
    EvolutionChainItem.fromJson(json.decode(str));

String evolutionChainItemToJson(EvolutionChainItem data) =>
    json.encode(data.toJson());

class EvolutionChainItem {
  int? count;
  String? next;
  String? previous;
  List<Result>? results;

  EvolutionChainItem({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  EvolutionChainItem copyWith({
    int? count,
    String? next,
    String? previous,
    List<Result>? results,
  }) =>
      EvolutionChainItem(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  factory EvolutionChainItem.fromJson(Map<String, dynamic> json) =>
      EvolutionChainItem(
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
  String? url;

  Result({
    this.url,
  });

  Result copyWith({
    String? url,
  }) =>
      Result(
        url: url ?? this.url,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

import 'dart:convert';

AbilityDetail abilityDetailFromJson(String str) =>
    AbilityDetail.fromJson(json.decode(str));

String abilityDetailToJson(AbilityDetail data) => json.encode(data.toJson());

class AbilityDetail {
  List<EffectChange>? effectChanges;
  List<AbilityDetailEffectEntry>? effectEntries;
  List<FlavorTextEntry>? flavorTextEntries;
  Generation? generation;
  int? id;
  bool? isMainSeries;
  String? name;
  List<Name>? names;
  List<Pokemon>? pokemon;

  AbilityDetail({
    this.effectChanges,
    this.effectEntries,
    this.flavorTextEntries,
    this.generation,
    this.id,
    this.isMainSeries,
    this.name,
    this.names,
    this.pokemon,
  });

  AbilityDetail copyWith({
    List<EffectChange>? effectChanges,
    List<AbilityDetailEffectEntry>? effectEntries,
    List<FlavorTextEntry>? flavorTextEntries,
    Generation? generation,
    int? id,
    bool? isMainSeries,
    String? name,
    List<Name>? names,
    List<Pokemon>? pokemon,
  }) =>
      AbilityDetail(
        effectChanges: effectChanges ?? this.effectChanges,
        effectEntries: effectEntries ?? this.effectEntries,
        flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
        generation: generation ?? this.generation,
        id: id ?? this.id,
        isMainSeries: isMainSeries ?? this.isMainSeries,
        name: name ?? this.name,
        names: names ?? this.names,
        pokemon: pokemon ?? this.pokemon,
      );

  factory AbilityDetail.fromJson(Map<String, dynamic> json) => AbilityDetail(
        effectChanges: json["effect_changes"] == null
            ? []
            : List<EffectChange>.from(
                json["effect_changes"]!.map((x) => EffectChange.fromJson(x))),
        effectEntries: json["effect_entries"] == null
            ? []
            : List<AbilityDetailEffectEntry>.from(json["effect_entries"]!
                .map((x) => AbilityDetailEffectEntry.fromJson(x))),
        flavorTextEntries: json["flavor_text_entries"] == null
            ? []
            : List<FlavorTextEntry>.from(json["flavor_text_entries"]!
                .map((x) => FlavorTextEntry.fromJson(x))),
        generation: json["generation"] == null
            ? null
            : Generation.fromJson(json["generation"]),
        id: json["id"],
        isMainSeries: json["is_main_series"],
        name: json["name"],
        names: json["names"] == null
            ? []
            : List<Name>.from(json["names"]!.map((x) => Name.fromJson(x))),
        pokemon: json["pokemon"] == null
            ? []
            : List<Pokemon>.from(
                json["pokemon"]!.map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "effect_changes": effectChanges == null
            ? []
            : List<dynamic>.from(effectChanges!.map((x) => x.toJson())),
        "effect_entries": effectEntries == null
            ? []
            : List<dynamic>.from(effectEntries!.map((x) => x.toJson())),
        "flavor_text_entries": flavorTextEntries == null
            ? []
            : List<dynamic>.from(flavorTextEntries!.map((x) => x.toJson())),
        "generation": generation?.toJson(),
        "id": id,
        "is_main_series": isMainSeries,
        "name": name,
        "names": names == null
            ? []
            : List<dynamic>.from(names!.map((x) => x.toJson())),
        "pokemon": pokemon == null
            ? []
            : List<dynamic>.from(pokemon!.map((x) => x.toJson())),
      };
}

class EffectChange {
  List<EffectChangeEffectEntry>? effectEntries;
  Generation? versionGroup;

  EffectChange({
    this.effectEntries,
    this.versionGroup,
  });

  EffectChange copyWith({
    List<EffectChangeEffectEntry>? effectEntries,
    Generation? versionGroup,
  }) =>
      EffectChange(
        effectEntries: effectEntries ?? this.effectEntries,
        versionGroup: versionGroup ?? this.versionGroup,
      );

  factory EffectChange.fromJson(Map<String, dynamic> json) => EffectChange(
        effectEntries: json["effect_entries"] == null
            ? []
            : List<EffectChangeEffectEntry>.from(json["effect_entries"]!
                .map((x) => EffectChangeEffectEntry.fromJson(x))),
        versionGroup: json["version_group"] == null
            ? null
            : Generation.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "effect_entries": effectEntries == null
            ? []
            : List<dynamic>.from(effectEntries!.map((x) => x.toJson())),
        "version_group": versionGroup?.toJson(),
      };
}

class EffectChangeEffectEntry {
  String? effect;
  Generation? language;

  EffectChangeEffectEntry({
    this.effect,
    this.language,
  });

  EffectChangeEffectEntry copyWith({
    String? effect,
    Generation? language,
  }) =>
      EffectChangeEffectEntry(
        effect: effect ?? this.effect,
        language: language ?? this.language,
      );

  factory EffectChangeEffectEntry.fromJson(Map<String, dynamic> json) =>
      EffectChangeEffectEntry(
        effect: json["effect"],
        language: json["language"] == null
            ? null
            : Generation.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "effect": effect,
        "language": language?.toJson(),
      };
}

class Generation {
  String? name;
  String? url;

  Generation({
    this.name,
    this.url,
  });

  Generation copyWith({
    String? name,
    String? url,
  }) =>
      Generation(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Generation.fromJson(Map<String, dynamic> json) => Generation(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class AbilityDetailEffectEntry {
  String? effect;
  Generation? language;
  String? shortEffect;

  AbilityDetailEffectEntry({
    this.effect,
    this.language,
    this.shortEffect,
  });

  AbilityDetailEffectEntry copyWith({
    String? effect,
    Generation? language,
    String? shortEffect,
  }) =>
      AbilityDetailEffectEntry(
        effect: effect ?? this.effect,
        language: language ?? this.language,
        shortEffect: shortEffect ?? this.shortEffect,
      );

  factory AbilityDetailEffectEntry.fromJson(Map<String, dynamic> json) =>
      AbilityDetailEffectEntry(
        effect: json["effect"],
        language: json["language"] == null
            ? null
            : Generation.fromJson(json["language"]),
        shortEffect: json["short_effect"],
      );

  Map<String, dynamic> toJson() => {
        "effect": effect,
        "language": language?.toJson(),
        "short_effect": shortEffect,
      };
}

class FlavorTextEntry {
  String? flavorText;
  Generation? language;
  Generation? versionGroup;

  FlavorTextEntry({
    this.flavorText,
    this.language,
    this.versionGroup,
  });

  FlavorTextEntry copyWith({
    String? flavorText,
    Generation? language,
    Generation? versionGroup,
  }) =>
      FlavorTextEntry(
        flavorText: flavorText ?? this.flavorText,
        language: language ?? this.language,
        versionGroup: versionGroup ?? this.versionGroup,
      );

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: json["language"] == null
            ? null
            : Generation.fromJson(json["language"]),
        versionGroup: json["version_group"] == null
            ? null
            : Generation.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language?.toJson(),
        "version_group": versionGroup?.toJson(),
      };
}

class Name {
  Generation? language;
  String? name;

  Name({
    this.language,
    this.name,
  });

  Name copyWith({
    Generation? language,
    String? name,
  }) =>
      Name(
        language: language ?? this.language,
        name: name ?? this.name,
      );

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null
            ? null
            : Generation.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language?.toJson(),
        "name": name,
      };
}

class Pokemon {
  bool? isHidden;
  Generation? pokemon;
  int? slot;

  Pokemon({
    this.isHidden,
    this.pokemon,
    this.slot,
  });

  Pokemon copyWith({
    bool? isHidden,
    Generation? pokemon,
    int? slot,
  }) =>
      Pokemon(
        isHidden: isHidden ?? this.isHidden,
        pokemon: pokemon ?? this.pokemon,
        slot: slot ?? this.slot,
      );

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        isHidden: json["is_hidden"],
        pokemon: json["pokemon"] == null
            ? null
            : Generation.fromJson(json["pokemon"]),
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "is_hidden": isHidden,
        "pokemon": pokemon?.toJson(),
        "slot": slot,
      };
}

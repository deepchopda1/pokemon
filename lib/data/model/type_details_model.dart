import 'dart:convert';

TypeDetail typeDetailFromJson(String str) =>
    TypeDetail.fromJson(json.decode(str));

String typeDetailToJson(TypeDetail data) => json.encode(data.toJson());

class TypeDetail {
  DamageRelations? damageRelations;
  List<GameIndex>? gameIndices;
  Generation? generation;
  int? id;
  Generation? moveDamageClass;
  List<Generation>? moves;
  String? name;
  List<Name>? names;
  List<dynamic>? pastDamageRelations;
  List<Pokemon>? pokemon;
  Sprites? sprites;

  TypeDetail({
    this.damageRelations,
    this.gameIndices,
    this.generation,
    this.id,
    this.moveDamageClass,
    this.moves,
    this.name,
    this.names,
    this.pastDamageRelations,
    this.pokemon,
    this.sprites,
  });

  TypeDetail copyWith({
    DamageRelations? damageRelations,
    List<GameIndex>? gameIndices,
    Generation? generation,
    int? id,
    Generation? moveDamageClass,
    List<Generation>? moves,
    String? name,
    List<Name>? names,
    List<dynamic>? pastDamageRelations,
    List<Pokemon>? pokemon,
    Sprites? sprites,
  }) =>
      TypeDetail(
        damageRelations: damageRelations ?? this.damageRelations,
        gameIndices: gameIndices ?? this.gameIndices,
        generation: generation ?? this.generation,
        id: id ?? this.id,
        moveDamageClass: moveDamageClass ?? this.moveDamageClass,
        moves: moves ?? this.moves,
        name: name ?? this.name,
        names: names ?? this.names,
        pastDamageRelations: pastDamageRelations ?? this.pastDamageRelations,
        pokemon: pokemon ?? this.pokemon,
        sprites: sprites ?? this.sprites,
      );

  factory TypeDetail.fromJson(Map<String, dynamic> json) => TypeDetail(
        damageRelations: json["damage_relations"] == null
            ? null
            : DamageRelations.fromJson(json["damage_relations"]),
        gameIndices: json["game_indices"] == null
            ? []
            : List<GameIndex>.from(
                json["game_indices"]!.map((x) => GameIndex.fromJson(x))),
        generation: json["generation"] == null
            ? null
            : Generation.fromJson(json["generation"]),
        id: json["id"],
        moveDamageClass: json["move_damage_class"] == null
            ? null
            : Generation.fromJson(json["move_damage_class"]),
        moves: json["moves"] == null
            ? []
            : List<Generation>.from(
                json["moves"]!.map((x) => Generation.fromJson(x))),
        name: json["name"],
        names: json["names"] == null
            ? []
            : List<Name>.from(json["names"]!.map((x) => Name.fromJson(x))),
        pastDamageRelations: json["past_damage_relations"] == null
            ? []
            : List<dynamic>.from(json["past_damage_relations"]!.map((x) => x)),
        pokemon: json["pokemon"] == null
            ? []
            : List<Pokemon>.from(
                json["pokemon"]!.map((x) => Pokemon.fromJson(x))),
        sprites:
            json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
      );

  Map<String, dynamic> toJson() => {
        "damage_relations": damageRelations?.toJson(),
        "game_indices": gameIndices == null
            ? []
            : List<dynamic>.from(gameIndices!.map((x) => x.toJson())),
        "generation": generation?.toJson(),
        "id": id,
        "move_damage_class": moveDamageClass?.toJson(),
        "moves": moves == null
            ? []
            : List<dynamic>.from(moves!.map((x) => x.toJson())),
        "name": name,
        "names": names == null
            ? []
            : List<dynamic>.from(names!.map((x) => x.toJson())),
        "past_damage_relations": pastDamageRelations == null
            ? []
            : List<dynamic>.from(pastDamageRelations!.map((x) => x)),
        "pokemon": pokemon == null
            ? []
            : List<dynamic>.from(pokemon!.map((x) => x.toJson())),
        "sprites": sprites?.toJson(),
      };
}

class DamageRelations {
  List<Generation>? doubleDamageFrom;
  List<Generation>? doubleDamageTo;
  List<Generation>? halfDamageFrom;
  List<Generation>? halfDamageTo;
  List<dynamic>? noDamageFrom;
  List<dynamic>? noDamageTo;

  DamageRelations({
    this.doubleDamageFrom,
    this.doubleDamageTo,
    this.halfDamageFrom,
    this.halfDamageTo,
    this.noDamageFrom,
    this.noDamageTo,
  });

  DamageRelations copyWith({
    List<Generation>? doubleDamageFrom,
    List<Generation>? doubleDamageTo,
    List<Generation>? halfDamageFrom,
    List<Generation>? halfDamageTo,
    List<dynamic>? noDamageFrom,
    List<dynamic>? noDamageTo,
  }) =>
      DamageRelations(
        doubleDamageFrom: doubleDamageFrom ?? this.doubleDamageFrom,
        doubleDamageTo: doubleDamageTo ?? this.doubleDamageTo,
        halfDamageFrom: halfDamageFrom ?? this.halfDamageFrom,
        halfDamageTo: halfDamageTo ?? this.halfDamageTo,
        noDamageFrom: noDamageFrom ?? this.noDamageFrom,
        noDamageTo: noDamageTo ?? this.noDamageTo,
      );

  factory DamageRelations.fromJson(Map<String, dynamic> json) =>
      DamageRelations(
        doubleDamageFrom: json["double_damage_from"] == null
            ? []
            : List<Generation>.from(
                json["double_damage_from"]!.map((x) => Generation.fromJson(x))),
        doubleDamageTo: json["double_damage_to"] == null
            ? []
            : List<Generation>.from(
                json["double_damage_to"]!.map((x) => Generation.fromJson(x))),
        halfDamageFrom: json["half_damage_from"] == null
            ? []
            : List<Generation>.from(
                json["half_damage_from"]!.map((x) => Generation.fromJson(x))),
        halfDamageTo: json["half_damage_to"] == null
            ? []
            : List<Generation>.from(
                json["half_damage_to"]!.map((x) => Generation.fromJson(x))),
        noDamageFrom: json["no_damage_from"] == null
            ? []
            : List<dynamic>.from(json["no_damage_from"]!.map((x) => x)),
        noDamageTo: json["no_damage_to"] == null
            ? []
            : List<dynamic>.from(json["no_damage_to"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "double_damage_from": doubleDamageFrom == null
            ? []
            : List<dynamic>.from(doubleDamageFrom!.map((x) => x.toJson())),
        "double_damage_to": doubleDamageTo == null
            ? []
            : List<dynamic>.from(doubleDamageTo!.map((x) => x.toJson())),
        "half_damage_from": halfDamageFrom == null
            ? []
            : List<dynamic>.from(halfDamageFrom!.map((x) => x.toJson())),
        "half_damage_to": halfDamageTo == null
            ? []
            : List<dynamic>.from(halfDamageTo!.map((x) => x.toJson())),
        "no_damage_from": noDamageFrom == null
            ? []
            : List<dynamic>.from(noDamageFrom!.map((x) => x)),
        "no_damage_to": noDamageTo == null
            ? []
            : List<dynamic>.from(noDamageTo!.map((x) => x)),
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

class GameIndex {
  int? gameIndex;
  Generation? generation;

  GameIndex({
    this.gameIndex,
    this.generation,
  });

  GameIndex copyWith({
    int? gameIndex,
    Generation? generation,
  }) =>
      GameIndex(
        gameIndex: gameIndex ?? this.gameIndex,
        generation: generation ?? this.generation,
      );

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        generation: json["generation"] == null
            ? null
            : Generation.fromJson(json["generation"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "generation": generation?.toJson(),
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
  Generation? pokemon;
  int? slot;

  Pokemon({
    this.pokemon,
    this.slot,
  });

  Pokemon copyWith({
    Generation? pokemon,
    int? slot,
  }) =>
      Pokemon(
        pokemon: pokemon ?? this.pokemon,
        slot: slot ?? this.slot,
      );

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        pokemon: json["pokemon"] == null
            ? null
            : Generation.fromJson(json["pokemon"]),
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "pokemon": pokemon?.toJson(),
        "slot": slot,
      };
}

class Sprites {
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationIx? generationIx;
  GenerationV? generationV;
  Map<String, GenerationVi>? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  Sprites({
    this.generationIii,
    this.generationIv,
    this.generationIx,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  Sprites copyWith({
    GenerationIii? generationIii,
    GenerationIv? generationIv,
    GenerationIx? generationIx,
    GenerationV? generationV,
    Map<String, GenerationVi>? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) =>
      Sprites(
        generationIii: generationIii ?? this.generationIii,
        generationIv: generationIv ?? this.generationIv,
        generationIx: generationIx ?? this.generationIx,
        generationV: generationV ?? this.generationV,
        generationVi: generationVi ?? this.generationVi,
        generationVii: generationVii ?? this.generationVii,
        generationViii: generationViii ?? this.generationViii,
      );

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        generationIii: json["generation-iii"] == null
            ? null
            : GenerationIii.fromJson(json["generation-iii"]),
        generationIv: json["generation-iv"] == null
            ? null
            : GenerationIv.fromJson(json["generation-iv"]),
        generationIx: json["generation-ix"] == null
            ? null
            : GenerationIx.fromJson(json["generation-ix"]),
        generationV: json["generation-v"] == null
            ? null
            : GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]!).map((k, v) =>
            MapEntry<String, GenerationVi>(k, GenerationVi.fromJson(v))),
        generationVii: json["generation-vii"] == null
            ? null
            : GenerationVii.fromJson(json["generation-vii"]),
        generationViii: json["generation-viii"] == null
            ? null
            : GenerationViii.fromJson(json["generation-viii"]),
      );

  Map<String, dynamic> toJson() => {
        "generation-iii": generationIii?.toJson(),
        "generation-iv": generationIv?.toJson(),
        "generation-ix": generationIx?.toJson(),
        "generation-v": generationV?.toJson(),
        "generation-vi": Map.from(generationVi!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii?.toJson(),
        "generation-viii": generationViii?.toJson(),
      };
}

class GenerationIii {
  GenerationVi? colosseum;
  GenerationVi? emerald;
  GenerationVi? fireredLeafgreen;
  GenerationVi? rubySaphire;
  GenerationVi? xd;

  GenerationIii({
    this.colosseum,
    this.emerald,
    this.fireredLeafgreen,
    this.rubySaphire,
    this.xd,
  });

  GenerationIii copyWith({
    GenerationVi? colosseum,
    GenerationVi? emerald,
    GenerationVi? fireredLeafgreen,
    GenerationVi? rubySaphire,
    GenerationVi? xd,
  }) =>
      GenerationIii(
        colosseum: colosseum ?? this.colosseum,
        emerald: emerald ?? this.emerald,
        fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
        rubySaphire: rubySaphire ?? this.rubySaphire,
        xd: xd ?? this.xd,
      );

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        colosseum: json["colosseum"] == null
            ? null
            : GenerationVi.fromJson(json["colosseum"]),
        emerald: json["emerald"] == null
            ? null
            : GenerationVi.fromJson(json["emerald"]),
        fireredLeafgreen: json["firered-leafgreen"] == null
            ? null
            : GenerationVi.fromJson(json["firered-leafgreen"]),
        rubySaphire: json["ruby-saphire"] == null
            ? null
            : GenerationVi.fromJson(json["ruby-saphire"]),
        xd: json["xd"] == null ? null : GenerationVi.fromJson(json["xd"]),
      );

  Map<String, dynamic> toJson() => {
        "colosseum": colosseum?.toJson(),
        "emerald": emerald?.toJson(),
        "firered-leafgreen": fireredLeafgreen?.toJson(),
        "ruby-saphire": rubySaphire?.toJson(),
        "xd": xd?.toJson(),
      };
}

class GenerationVi {
  String? nameIcon;

  GenerationVi({
    this.nameIcon,
  });

  GenerationVi copyWith({
    String? nameIcon,
  }) =>
      GenerationVi(
        nameIcon: nameIcon ?? this.nameIcon,
      );

  factory GenerationVi.fromJson(Map<String, dynamic> json) => GenerationVi(
        nameIcon: json["name_icon"],
      );

  Map<String, dynamic> toJson() => {
        "name_icon": nameIcon,
      };
}

class GenerationIv {
  GenerationVi? diamondPearl;
  GenerationVi? heartgoldSoulsilver;
  GenerationVi? platinum;

  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  GenerationIv copyWith({
    GenerationVi? diamondPearl,
    GenerationVi? heartgoldSoulsilver,
    GenerationVi? platinum,
  }) =>
      GenerationIv(
        diamondPearl: diamondPearl ?? this.diamondPearl,
        heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
        platinum: platinum ?? this.platinum,
      );

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: json["diamond-pearl"] == null
            ? null
            : GenerationVi.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: json["heartgold-soulsilver"] == null
            ? null
            : GenerationVi.fromJson(json["heartgold-soulsilver"]),
        platinum: json["platinum"] == null
            ? null
            : GenerationVi.fromJson(json["platinum"]),
      );

  Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl?.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver?.toJson(),
        "platinum": platinum?.toJson(),
      };
}

class GenerationIx {
  GenerationVi? scarletViolet;

  GenerationIx({
    this.scarletViolet,
  });

  GenerationIx copyWith({
    GenerationVi? scarletViolet,
  }) =>
      GenerationIx(
        scarletViolet: scarletViolet ?? this.scarletViolet,
      );

  factory GenerationIx.fromJson(Map<String, dynamic> json) => GenerationIx(
        scarletViolet: json["scarlet-violet"] == null
            ? null
            : GenerationVi.fromJson(json["scarlet-violet"]),
      );

  Map<String, dynamic> toJson() => {
        "scarlet-violet": scarletViolet?.toJson(),
      };
}

class GenerationV {
  GenerationVi? black2White2;
  GenerationVi? blackWhite;

  GenerationV({
    this.black2White2,
    this.blackWhite,
  });

  GenerationV copyWith({
    GenerationVi? black2White2,
    GenerationVi? blackWhite,
  }) =>
      GenerationV(
        black2White2: black2White2 ?? this.black2White2,
        blackWhite: blackWhite ?? this.blackWhite,
      );

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        black2White2: json["black-2-white-2"] == null
            ? null
            : GenerationVi.fromJson(json["black-2-white-2"]),
        blackWhite: json["black-white"] == null
            ? null
            : GenerationVi.fromJson(json["black-white"]),
      );

  Map<String, dynamic> toJson() => {
        "black-2-white-2": black2White2?.toJson(),
        "black-white": blackWhite?.toJson(),
      };
}

class GenerationVii {
  GenerationVi? letsGoPikachuLetsGoEevee;
  GenerationVi? sunMoon;
  GenerationVi? ultraSunUltraMoon;

  GenerationVii({
    this.letsGoPikachuLetsGoEevee,
    this.sunMoon,
    this.ultraSunUltraMoon,
  });

  GenerationVii copyWith({
    GenerationVi? letsGoPikachuLetsGoEevee,
    GenerationVi? sunMoon,
    GenerationVi? ultraSunUltraMoon,
  }) =>
      GenerationVii(
        letsGoPikachuLetsGoEevee:
            letsGoPikachuLetsGoEevee ?? this.letsGoPikachuLetsGoEevee,
        sunMoon: sunMoon ?? this.sunMoon,
        ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
      );

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        letsGoPikachuLetsGoEevee: json["lets-go-pikachu-lets-go-eevee"] == null
            ? null
            : GenerationVi.fromJson(json["lets-go-pikachu-lets-go-eevee"]),
        sunMoon: json["sun-moon"] == null
            ? null
            : GenerationVi.fromJson(json["sun-moon"]),
        ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null
            ? null
            : GenerationVi.fromJson(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toJson() => {
        "lets-go-pikachu-lets-go-eevee": letsGoPikachuLetsGoEevee?.toJson(),
        "sun-moon": sunMoon?.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon?.toJson(),
      };
}

class GenerationViii {
  GenerationVi? brilliantDiamondAndShiningPearl;
  GenerationVi? legendsArceus;
  GenerationVi? swordShield;

  GenerationViii({
    this.brilliantDiamondAndShiningPearl,
    this.legendsArceus,
    this.swordShield,
  });

  GenerationViii copyWith({
    GenerationVi? brilliantDiamondAndShiningPearl,
    GenerationVi? legendsArceus,
    GenerationVi? swordShield,
  }) =>
      GenerationViii(
        brilliantDiamondAndShiningPearl: brilliantDiamondAndShiningPearl ??
            this.brilliantDiamondAndShiningPearl,
        legendsArceus: legendsArceus ?? this.legendsArceus,
        swordShield: swordShield ?? this.swordShield,
      );

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        brilliantDiamondAndShiningPearl:
            json["brilliant-diamond-and-shining-pearl"] == null
                ? null
                : GenerationVi.fromJson(
                    json["brilliant-diamond-and-shining-pearl"]),
        legendsArceus: json["legends-arceus"] == null
            ? null
            : GenerationVi.fromJson(json["legends-arceus"]),
        swordShield: json["sword-shield"] == null
            ? null
            : GenerationVi.fromJson(json["sword-shield"]),
      );

  Map<String, dynamic> toJson() => {
        "brilliant-diamond-and-shining-pearl":
            brilliantDiamondAndShiningPearl?.toJson(),
        "legends-arceus": legendsArceus?.toJson(),
        "sword-shield": swordShield?.toJson(),
      };
}

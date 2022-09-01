class PokemonModel {
  PokemonModel({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.stats,
  });

  int id;
  String name;
  int baseExperience;
  int height;
  int weight;
  List<Types> types;
  List<Abilities> abilities;
  List<Stats> stats;

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    final id = json["id"];
    final name = json["name"];
    final baseExperience = json["base_experience"];
    final height = json["height"];
    final weight = json["weight"];
    final types = List<Types>.from(
      json['types'].map((x) => Types.fromMap(x)),
    );
    final abilities = List<Abilities>.from(
      json['abilities'].map((x) => Abilities.fromMap(x)),
    );
    final stats = List<Stats>.from(
      json['stats'].map((x) => Stats.fromMap(x)),
    );

    return PokemonModel(
      id: id,
      name: name,
      baseExperience: baseExperience,
      height: height,
      weight: weight,
      types: types,
      abilities: abilities,
      stats: stats,
    );
  }
}

class Abilities {
  Abilities({required this.slot, required this.ability});

  int slot;
  Ability ability;

  factory Abilities.fromMap(Map<String, dynamic> json) => Abilities(
        slot: json['slot'],
        ability: Ability.fromMap(json['ability'] ?? {'name': 'no ability'}),
      );
}

class Ability {
  String name;

  Ability({required this.name});

  factory Ability.fromMap(Map<String, dynamic> json) =>
      Ability(name: json['name']);
}

class Types {
  Types({required this.slot, required this.type});

  int slot;
  Type type;
  factory Types.fromMap(Map<String, dynamic> json) => Types(
        slot: json['slot'],
        type: Type.fromMap(json['type'] ?? {'name': 'normal'}),
      );
}

class Type {
  String name;

  Type({required this.name});

  factory Type.fromMap(Map<String, dynamic> json) => Type(name: json['name']);
}

class Stats {
  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  int baseStat;
  int effort;
  Stat stat;
  factory Stats.fromMap(Map<String, dynamic> json) => Stats(
        baseStat: json['base_stat'],
        effort: json['effort'],
        stat: Stat.fromMap(json['stat'] ?? {'name': 'no-stats'}),
      );
}

class Stat {
  String name;

  Stat({required this.name});

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(name: json['name']);
}

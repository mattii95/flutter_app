class PokemonSpeciesModel {
  PokemonSpeciesModel({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.habitat,
  });

  int baseHappiness;
  int captureRate;
  ColorModel color;
  HabitatModel habitat;

  factory PokemonSpeciesModel.fromMap(Map<String, dynamic> json) =>
      PokemonSpeciesModel(
        baseHappiness: json['base_happiness'] ?? 0,
        captureRate: json['capture_rate'] ?? 0,
        color: ColorModel.fromMap(json['color'] ?? {'name': 'red'}),
        habitat:
            HabitatModel.fromMap(json['habitat'] ?? {'name': 'sin habitat'}),
      );
}

class ColorModel {
  ColorModel({required this.name});

  String name;

  factory ColorModel.fromMap(Map<String, dynamic> json) =>
      ColorModel(name: json['name']);
}

class HabitatModel {
  HabitatModel({required this.name});
  String name;

  factory HabitatModel.fromMap(Map<String, dynamic> json) =>
      HabitatModel(name: json['name']);
}

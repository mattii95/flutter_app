// To parse this JSON data, do
//
//     final pokedexModel = pokedexModelFromMap(jsonString);

import 'dart:convert';

PokedexModel pokedexModelFromMap(String str) =>
    PokedexModel.fromMap(json.decode(str));

class PokedexModel {
  PokedexModel(this.count, this.nextPage, this.pokemonListening);

  final int count;
  final bool nextPage;
  final List<PokedexResultModel> pokemonListening;

  factory PokedexModel.fromMap(Map<String, dynamic> json) {
    final count = json['count'];
    final nextPage = json['next'] != null;
    final pokemonListening = (json['results'] as List)
        .map((pokemon) => PokedexResultModel.fromMap(pokemon))
        .toList();

    return PokedexModel(count, nextPage, pokemonListening);
  }
}

class PokedexResultModel {
  PokedexResultModel(this.id, this.name);

  final int id;
  final String name;

  factory PokedexResultModel.fromMap(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokedexResultModel(id, name);
  }
}

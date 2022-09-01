import 'dart:convert';

import 'package:flutter_basic_app/pokedex/models/models.dart';
import 'package:http/http.dart' as http;

class PokeProvider {
  final String authority = 'pokeapi.co';
  final client = http.Client();

  Future<PokedexModel> getPokedex(int pageIndex) async {
    const String unencodedPath = '/api/v2/pokemon';

    final Map<String, dynamic> queryParameters = {
      'limit': '200',
      'offset': (pageIndex * 200).toString()
    };

    final url = Uri.https(authority, unencodedPath, queryParameters);

    final response = await client.get(url);

    final json = jsonDecode(response.body);

    return PokedexModel.fromMap(json);
  }

  Future<PokemonModel> getPokemon(String id) async {
    final String unencodedPath = '/api/v2/pokemon/$id/';

    final url = Uri.https(authority, unencodedPath);

    final response = await client.get(url);

    final json = jsonDecode(response.body);

    return PokemonModel.fromMap(json);
  }

  Future<PokemonSpeciesModel> getPokemonSpecies(String id) async {
    final String unencodedPath = '/api/v2/pokemon-species/$id/';

    final url = Uri.https(authority, unencodedPath);

    final response = await client.get(url);

    final json = jsonDecode(response.body);

    return PokemonSpeciesModel.fromMap(json);
  }
}

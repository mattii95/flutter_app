import 'package:flutter_basic_app/pokedex/models/pokedex_model.dart';
import 'package:flutter_basic_app/pokedex/models/pokemon_model.dart';
import 'package:flutter_basic_app/pokedex/models/pokemon_species_model.dart';
import 'package:flutter_basic_app/pokedex/resources/poke_provider.dart';

class PokeRepository {
  final pokeProvider = PokeProvider();

  Future<PokedexModel> getPokedexList(int indexPage) async {
    return await pokeProvider.getPokedex(indexPage);
  }

  Future<PokemonModel> getPokemon(String id) async {
    return await pokeProvider.getPokemon(id);
  }

  Future<PokemonSpeciesModel> getPokemonSpecie(String id) async {
    return await pokeProvider.getPokemonSpecies(id);
  }
}

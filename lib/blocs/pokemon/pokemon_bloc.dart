import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_basic_app/pokedex/models/pokemon_model.dart';
import 'package:flutter_basic_app/pokedex/models/pokemon_species_model.dart';
import 'package:flutter_basic_app/pokedex/resources/poke_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokeRepository _pokeRepository;

  PokemonBloc(this._pokeRepository) : super(PokemonInitial()) {
    on<LoadPokemonEvent>((event, emit) async {
      final pokemon = await _pokeRepository.getPokemon(event.id);
      final specie = await _pokeRepository.getPokemonSpecie(event.id);
      emit(PokemonLoadedState(pokemon, specie, specie.color));
    });
  }
}

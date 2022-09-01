import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_basic_app/pokedex/models/pokedex_model.dart';
import 'package:flutter_basic_app/pokedex/resources/poke_repository.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final PokeRepository _pokeRepository;

  PokedexBloc(this._pokeRepository) : super(PokedexLoadingState()) {
    on<LoadPokedexEvent>((event, emit) async {
      final pokedex = await _pokeRepository.getPokedexList(0);
      emit(PokedexLoadedState(pokedex.pokemonListening, pokedex.nextPage));
    });
  }
}

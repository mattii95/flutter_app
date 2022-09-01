part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
}

class PokemonInitial extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonLoadedState extends PokemonState {
  final PokemonModel pokemon;
  final PokemonSpeciesModel specie;
  final ColorModel color;

  const PokemonLoadedState(this.pokemon, this.specie, this.color);

  @override
  List<Object?> get props => [pokemon, specie, color];
}

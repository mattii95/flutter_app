part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class LoadPokemonEvent extends PokemonEvent {
  final String id;

  const LoadPokemonEvent(this.id);

  @override
  List<Object> get props => [];
}

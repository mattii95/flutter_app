part of 'pokedex_bloc.dart';

abstract class PokedexEvent extends Equatable {
  const PokedexEvent();
}

class LoadPokedexEvent extends PokedexEvent {
  @override
  List<Object> get props => [];
}

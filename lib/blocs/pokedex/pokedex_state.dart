part of 'pokedex_bloc.dart';

abstract class PokedexState extends Equatable {
  const PokedexState();
}

class PokedexLoadingState extends PokedexState {
  @override
  List<Object> get props => [];
}

class PokedexLoadedState extends PokedexState {
  final List<PokedexResultModel> resultModel;
  final bool next;

  const PokedexLoadedState(this.resultModel, this.next);

  @override
  List<Object> get props => [resultModel, next];
}

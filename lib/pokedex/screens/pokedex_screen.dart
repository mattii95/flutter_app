import 'package:flutter/material.dart';
import 'package:flutter_basic_app/blocs/pokedex/pokedex_bloc.dart';
import 'package:flutter_basic_app/pokedex/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokedex = BlocProvider.of<PokedexBloc>(context, listen: false)
        .add(LoadPokedexEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('POKEDEX'),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<PokedexBloc, PokedexState>(
        builder: (context, state) {
          if (state is PokedexLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PokedexLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return PokeCard(pokedexListing: state.resultModel[index]);
              },
              itemCount: state.resultModel.length,
            );
          }

          return const Center(child: Text('No hay datos'));
        },
      ),
    );
  }
}

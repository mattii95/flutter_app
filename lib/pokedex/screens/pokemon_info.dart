import 'package:flutter/material.dart';
import 'package:flutter_basic_app/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_basic_app/pokedex/helpers/calculate_double.dart';
import 'package:flutter_basic_app/pokedex/models/pokemon_model.dart';
import 'package:flutter_basic_app/pokedex/models/pokemon_species_model.dart';
import 'package:flutter_basic_app/pokedex/themes/pokemon_colors.dart';
import 'package:flutter_basic_app/pokedex/widgets/percent_indicator_stats.dart';
import 'package:flutter_basic_app/pokedex/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String id =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-id';

    final pokemon = BlocProvider.of<PokemonBloc>(context, listen: false)
        .add(LoadPokemonEvent(id));

    return Scaffold(
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadedState) {
            return CustomScrollView(
              slivers: [
                _CustomAppBar(
                  pokemon: state.pokemon,
                  species: state.specie,
                  color: state.color,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      _PokemonInformation(
                        pokemon: state.pokemon,
                        species: state.specie,
                        color: state.color,
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(child: Text('No data info'));
          }
        },
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final PokemonModel pokemon;
  final PokemonSpeciesModel species;
  final ColorModel color;
  const _CustomAppBar(
      {Key? key,
      required this.color,
      required this.pokemon,
      required this.species})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor:
          (color.name != "") ? PokemonColors().get(color.name) : Colors.grey,
      expandedHeight: 200,
      collapsedHeight: 200,
      floating: false,
      pinned: true,
      title: const Text('Pokedex'),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        background: Container(
          width: double.infinity,
          alignment: Alignment.bottomRight,
          child: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png'),
            fit: BoxFit.cover,
          ),
        ),
        title: Container(
          width: double.infinity,
          height: 200,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    pokemon.name.toUpperCase(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 20,
                  child: ListView.builder(
                    itemCount: pokemon.types.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          height: 20,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const TypesPokemonsColors()
                                .get(pokemon.types[index].type.name),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            pokemon.types[index].type.name.toUpperCase(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PokemonInformation extends StatelessWidget {
  final PokemonModel pokemon;
  final PokemonSpeciesModel species;
  final ColorModel color;
  const _PokemonInformation(
      {Key? key,
      required this.pokemon,
      required this.species,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final colorPokemon = PokemonColors().get(color.name);
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pokedex Information',
            style: textTheme.titleLarge!.copyWith(color: colorPokemon),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          PokeData(title: 'Height', data: pokemon.height.toString()),
          PokeData(title: 'Weight', data: pokemon.weight.toString()),
          PokeData(title: 'Habitat', data: species.habitat.name),
          PokeData(
            title: 'Base Experience',
            data: pokemon.baseExperience.toString(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Abilities',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    pokemon.abilities.length,
                    (index) => Text(
                      pokemon.abilities[index].ability.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          Text(
            'Stats',
            style: textTheme.titleLarge!.copyWith(color: colorPokemon),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          Column(
            children: List.generate(
              pokemon.stats.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: PercentIndicatorStats(
                  title: pokemon.stats[index].stat.name,
                  data: pokemon.stats[index].baseStat.toString(),
                  color: colorPokemon,
                  percent: CalculateDouble().calculateDoublePercentStats(
                    pokemon.stats[index].baseStat,
                  ),
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        ],
      ),
    );
  }
}

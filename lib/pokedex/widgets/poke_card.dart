import 'package:flutter/material.dart';
import 'package:flutter_basic_app/pokedex/models/pokedex_model.dart';

class PokeCard extends StatelessWidget {
  final PokedexResultModel pokedexListing;
  const PokeCard({Key? key, required this.pokedexListing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'pokemon',
              arguments: pokedexListing.id.toString());
        },
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(3, 4),
                  blurRadius: 2,
                  spreadRadius: 0,
                ),
              ]),
          child: Stack(
            children: [
              Transform(
                transform: Matrix4.rotationZ(0.3),
                child: Text(
                  pokedexListing.id.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 40),
                    Text(
                      pokedexListing.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                      ),
                    ),
                    FadeInImage(
                      placeholder: const AssetImage('assets/loading.gif'),
                      image: NetworkImage(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokedexListing.id}.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

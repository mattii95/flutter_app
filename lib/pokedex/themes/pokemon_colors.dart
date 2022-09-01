import 'package:flutter/material.dart';

class PokemonColors {
  final normal = const Color(0xFFb3b5b2);
  final red = Colors.red;
  final blue = Colors.blue;
  final yellow = const Color.fromARGB(255, 255, 200, 62);
  final green = Colors.green;
  final black = Colors.black;
  final brown = Colors.brown;
  final purple = Colors.purple;
  final grey = Colors.grey;
  final white = Colors.white;
  final pink = Colors.pink;

  PokemonColors();

  Map<String, dynamic> toMap() {
    return {
      'notmal': normal,
      'red': red,
      'blue': blue,
      'yellow': yellow,
      'green': green,
      'black': black,
      'brown': brown,
      'purple': purple,
      'grey': grey,
      'white': white,
      'pink': pink
    };
  }

  dynamic get(String colorName) {
    var map = toMap();
    if (map.containsKey(colorName)) {
      return map[colorName];
    }
    throw ArgumentError('propery not found');
  }
}

class TypesPokemonsColors {
  final normal = const Color(0xFFb3b5b2);
  final fire = const Color(0xFFF4934D);
  final fighting = const Color(0xFFEB4971);
  final water = const Color(0xFF75b1e5);
  final flying = const Color(0xFFB8A5F2);
  final grass = const Color(0xFF7fca79);
  final poison = const Color(0xFFc582d9);
  final electric = const Color(0xFFF9DF78);
  final ground = const Color(0xFFF78551);
  final psychic = const Color(0xFFfb9d9a);
  final rock = const Color(0xFFd4c9a1);
  final ice = const Color(0xFF91d9cd);
  final bug = const Color(0xFFB5C534);
  final dragon = const Color(0xFF8656FA);
  final ghost = const Color(0xFF7f8ac9);
  final dark = const Color(0xFF7a7981);
  final steel = const Color(0xFF78aab5);
  final fairy = const Color(0xFFf1a6eb);

  const TypesPokemonsColors();

  Map<String, dynamic> _toMap() {
    return {
      'normal': normal,
      'fire': fire,
      'fighting': fighting,
      'water': water,
      'flying': flying,
      'grass': grass,
      'poison': poison,
      'electric': electric,
      'ground': ground,
      'psychic': psychic,
      'rock': rock,
      'ice': ice,
      'bug': bug,
      'dragon': dragon,
      'ghost': ghost,
      'dark': dark,
      'steel': steel,
      'fairy': fairy,
    };
  }

  dynamic get(String propertyName) {
    var map = _toMap();
    if (map.containsKey(propertyName)) {
      return map[propertyName];
    }
    throw ArgumentError('propery not found');
  }
}

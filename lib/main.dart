import 'package:flutter/material.dart';
import 'package:flutter_basic_app/blocs/pokedex/pokedex_bloc.dart';
import 'package:flutter_basic_app/blocs/pokemon/pokemon_bloc.dart';
import 'package:flutter_basic_app/blocs/post/post_bloc.dart';
import 'package:flutter_basic_app/blocs/post_list/post_list_bloc.dart';
import 'package:flutter_basic_app/crud/resources/post_repository.dart';
import 'package:flutter_basic_app/crud/screens/add_post_screen.dart';
import 'package:flutter_basic_app/crud/screens/crud_screen.dart';
import 'package:flutter_basic_app/crud/screens/view_post_screen.dart';
import 'package:flutter_basic_app/home_screen.dart';
import 'package:flutter_basic_app/pokedex/resources/poke_repository.dart';
import 'package:flutter_basic_app/pokedex/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PokeRepository(),
        ),
        RepositoryProvider(
          create: (context) => PostRepository(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repositoryProvider = RepositoryProvider.of<PokeRepository>(context);
    final repositoryPostProvider =
        RepositoryProvider.of<PostRepository>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokedexBloc(repositoryProvider)),
        BlocProvider(create: (context) => PokemonBloc(repositoryProvider)),
        BlocProvider(create: (context) => PostBloc(repositoryPostProvider)),
        BlocProvider(create: (context) => PostListBloc(repositoryPostProvider)),
      ],
      child: MaterialApp(
        title: 'Flutter Basic App',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomeScreen(),
          'pokedex': (context) => const PokedexScreen(),
          'pokemon': (context) => const PokemonInfo(),
          'crud': (context) => const CRUDScreen(),
          'post': (context) => const ViewPostScreen(),
          'add-post': (context) => const AddPostScreen(),
        },
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo),
        ),
      ),
    );
  }
}

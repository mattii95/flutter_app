import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: const [
          _ButtonOption(
            title: 'CRUD',
            routeName: 'crud',
            routeImageAssets: 'assets/abm_bg.jpg',
          ),
          SizedBox(height: 5),
          _ButtonOption(
            title: 'Pokedex',
            routeName: 'pokedex',
            routeImageAssets: 'assets/pokedex_bg.jpg',
          )
        ],
      ),
    );
  }
}

class _ButtonOption extends StatelessWidget {
  final String title;
  final String routeName;
  final String routeImageAssets;

  const _ButtonOption(
      {Key? key,
      required this.title,
      required this.routeName,
      required this.routeImageAssets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(4, 8),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, routeName),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  routeImageAssets,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.white38,
                  height: 30,
                  width: double.infinity,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PokeData extends StatelessWidget {
  final String title;
  final String data;
  const PokeData({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            data,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

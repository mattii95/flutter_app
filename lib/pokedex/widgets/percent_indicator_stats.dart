import 'package:flutter/material.dart';
import 'package:flutter_basic_app/pokedex/widgets/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicatorStats extends StatelessWidget {
  final String title;
  final String data;
  final double percent;
  final Color color;
  const PercentIndicatorStats(
      {Key? key,
      required this.title,
      required this.data,
      required this.color,
      required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      lineHeight: 20.0,
      animationDuration: 1500,
      percent: percent,
      center: SizedBox(
        width: double.infinity,
        child: PokeData(title: title, data: data.toString()),
      ),
      barRadius: const Radius.circular(10),
      progressColor: color,
    );
  }
}

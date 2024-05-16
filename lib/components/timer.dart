import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GameTimer extends StatelessWidget {
  final int timer;
  const GameTimer({
    Key? key,
    required this.timer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width,
            lineHeight: 20,
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 1000,
            barRadius: const Radius.circular(10),
            percent: timer / 20,
            progressColor: const Color.fromRGBO(111, 59, 126, 1),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("$timer seconds remaining"),
            ),
          ],
        )
      ],
    );
  }
}

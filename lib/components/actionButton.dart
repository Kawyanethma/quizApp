import 'package:flutter/material.dart';

class Actionbutton extends StatelessWidget {
  final int number;
  final Function checkAnswer;
  const Actionbutton(
      {required this.number, required this.checkAnswer, super.key});

  Color getColor() {
    if (number == 10) {
      return const Color.fromRGBO(153, 23, 14, 1);
    } else if (number == 11) {
      return const Color.fromRGBO(10, 103, 67, 1);
    } else {
      return const Color.fromRGBO(111, 59, 126, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: getColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (number == 11) {
            checkAnswer(true);
          } else {
            checkAnswer(false);
          }
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Icon(
              number == 10 ? Icons.close : Icons.check,
              color: Colors.white,
              size: 18,
            )));
  }
}

import 'package:flutter/material.dart';

class NumButton extends StatelessWidget {
  final int number;
  final Function updateAnswer;

  const NumButton({Key? key, required this.number, required this.updateAnswer})
      : super(key: key);
  Color getColor() {
    if (number == 3) {
      return const Color.fromRGBO(28, 3, 34, 1);
    } else if (number == 5) {
      return const Color.fromRGBO(145, 103, 155, 1);
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
          updateAnswer(number);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("You selected $number, press check to submit!"),
            duration: const Duration(milliseconds: 500),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "$number",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: number == 3 ? Colors.white : Colors.black87),
          ),
        ));
  }
}

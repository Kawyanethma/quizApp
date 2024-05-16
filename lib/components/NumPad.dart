import 'package:flutter/material.dart';
import 'package:quiz_app/components/actionButton.dart';
import 'package:quiz_app/components/button.dart';

class Numpad extends StatelessWidget {
  final int solution;
  final Function updateAnswer;
  final Function checkAnswer;
  const Numpad({
    Key? key,
    required this.solution,
    required this.updateAnswer,
    required this.checkAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.width / 1.5,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumButton(
              number: 1,
              updateAnswer: updateAnswer,
            ),
            NumButton(
              number: 2,
              updateAnswer: updateAnswer,
            ),
            NumButton(
              number: 3,
              updateAnswer: updateAnswer,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumButton(
              number: 4,
              updateAnswer: updateAnswer,
            ),
            NumButton(
              number: 5,
              updateAnswer: updateAnswer,
            ),
            NumButton(
              number: 6,
              updateAnswer: updateAnswer,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumButton(
              number: 7,
              updateAnswer: updateAnswer,
            ),
            NumButton(
              number: 8,
              updateAnswer: updateAnswer,
            ),
            NumButton(
              number: 9,
              updateAnswer: updateAnswer,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Actionbutton(number: 10, checkAnswer: checkAnswer),
            NumButton(
              number: 0,
              updateAnswer: updateAnswer,
            ),
            Actionbutton(number: 11, checkAnswer: checkAnswer),
          ],
        )
      ]),
    );
  }
}

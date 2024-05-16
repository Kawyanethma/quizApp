import 'package:flutter/material.dart';

class QuestionBlock extends StatelessWidget {
  final String question;

  const QuestionBlock({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 1.75,
      width: double.infinity,
      child: question == ""
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(212, 212, 212, 1)),
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(question)),
                );
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiz_app/components/NumPad.dart';
import 'package:quiz_app/components/question.dart';
import 'package:quiz_app/components/timer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences prefs;
  late Timer gametimer;
  bool gameStarted = false;
  String question = "";
  int highestscore = 0;
  int answer = 10;
  int noOfQuestions = 0;
  int skipped = 0;
  int score = 0;
  int wrong = 0;
  int solution = 0;
  int timer = 20;

  void resetGame() {
    setState(() {
      question = "";
      noOfQuestions = 0;
      gameStarted = true;
      skipped = 0;
      score = 0;
      wrong = 0;
      solution = 0;
      timer = 20;
    });
  }

  Future<void> getData() async {
    setState(() {
      question = "";
      solution = 0;
    });
    try {
      Response response =
          await get(Uri.parse('https://marcconrad.com/uob/smile/api.php'));
      Map data = jsonDecode(response.body);
      setState(() {
        question = data["question"];
        solution = data["solution"];
      });
      print(data);
    } catch (e) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                title: const Text("Connection Error!"),
                content: Text(
                    "check your internet connection and try again! \n$e\n"),
                actions: [
                  TextButton(
                    onPressed: () {
                       SystemNavigator.pop();
                    },
                    child: const Text("Exit"),
                  ),
                ],
              ));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "API error please try again :(",
        selectionColor: Colors.red,
      )));
    }
  }

  void checkAnswer(bool done) {
    if (done) {
      if (solution == answer) {
        updateScore();
        Fluttertoast.showToast(
            msg: 'Correct answer!',
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: const Color.fromARGB(255, 11, 104, 14),
            textColor: Colors.white);
      } else if (answer == 10) {
        Fluttertoast.showToast(
          msg: 'Please select an answer!',
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        wrongAnswer();
        Fluttertoast.showToast(
            msg: 'Wrong answer!',
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: const Color.fromARGB(255, 141, 3, 3),
            textColor: Colors.white);
      }
    } else {
      if (answer != 10) {
        setState(() {
          answer = 10;
        });
        Fluttertoast.showToast(
          msg: 'Anwser cleared! Please select an answer!',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }
  }

  void updateAnswer(int number) {
    setState(() {
      answer = number;
    });
  }

  void updateScore() {
    getData();
    setState(() {
      score = score + 5;
      timer = 20;
      noOfQuestions++;
    });
  }

  void wrongAnswer() {
    getData();
    setState(() {
      timer = 20;
      noOfQuestions++;
      wrong++;
    });
  }

  void endSummery() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text("Game Over!"),
              content: Text(
                  "Your Score is $score\nYour Highest Score is $highestscore\n"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    getData();
                    startTimer();
                    resetGame();
                  },
                  child: const Text("Try Again"),
                ),
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text("Exit"),
                )
              ],
            ));
  }

  void startTimer() {
    gametimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timerfunc();
    });
  }

  void timerfunc() {
    if (noOfQuestions >= 10 || wrong >= 3 || skipped >= 3) {
      highestscore < score ? highestscore = score : null;
      prefs.setInt("highestscore", highestscore);

      if (score == 50) {
        Fluttertoast.showToast(
            msg: 'Congratulations! You have completed the game!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: const Color.fromARGB(255, 93, 11, 104),
            textColor: Colors.white);
      }
      gameStarted = false;
      endSummery();
      gametimer.cancel();
    }
    if (timer == 0) {
      getData();
      setState(() {
        timer = 20;
        skipped++;
        noOfQuestions++;
      });
    }
    if (question.isNotEmpty) {
      setState(() {
        timer--;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                title: const Text("Welcome to the Quiz Game!"),
                content: const Text(
                    "Select the correct answer to the question! and click on the check button to submit your answer!"),
                actions: [
                  TextButton(
                    onPressed: () async {
                      prefs = await SharedPreferences.getInstance();
                      highestscore = prefs.getInt("highestscore") ?? 0;
                      Navigator.pop(context);
                      getData();
                      startTimer();
                      setState(() {
                        gameStarted = true;
                      });
                    },
                    child: const Text("Start Game"),
                  )
                ],
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(111, 59, 126, 1),
        title: const Text(
          "Quiz Game",
          style: TextStyle(color: Colors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Question: $noOfQuestions\nSkip count: $skipped\nScore: $score",
                      style: const TextStyle(color: Colors.white)),
                  Row(
                    children: [
                      Icon(Icons.favorite,
                          color: wrong >= 1
                              ? Colors.white
                              : const Color.fromRGBO(239, 124, 251, 1)),
                      Icon(Icons.favorite,
                          color: wrong >= 2
                              ? Colors.white
                              : const Color.fromRGBO(239, 124, 251, 1)),
                      Icon(Icons.favorite,
                          color: wrong == 3
                              ? Colors.white
                              : const Color.fromRGBO(239, 124, 251, 1))
                    ],
                  )
                ],
              ),
            )),
      ),
      backgroundColor: const Color.fromRGBO(180, 153, 186, 1),
      body: SafeArea(
        child: Column(
          children: [
            GameTimer(timer: timer),
            gameStarted
                ? QuestionBlock(question: question)
                : SizedBox(
                    height: MediaQuery.of(context).size.width / 1.75,
                    width: double.infinity,
                  ),
            Numpad(
                solution: solution,
                updateAnswer: updateAnswer,
                checkAnswer: checkAnswer),
          ],
        ),
      ),
    );
  }
}

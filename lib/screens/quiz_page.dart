import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/question.dart';
import 'package:flutter_quiz_app/widgets/loading_bar.dart';
import 'package:flutter_quiz_app/widgets/question_widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool isTimeOut = false;
  int answer = -1;
  final key = GlobalKey<LoadingBarState>();

  @override
  Widget build(BuildContext context) {
    bool isDone = isTimeOut == true || answer > -1;
    Questions question = questions[0];

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  LoadingBar(
                    key: key,
                    onTimeOut: () {
                      setState(() {
                        isTimeOut = true;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(questions[0].question),
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                Text(answer.toString()),
                                ...question.options.map(
                                  (
                                    e,
                                  ) {
                                    int index = question.options.indexOf(e);

                                    return questionWidget(
                                      text:
                                          "${String.fromCharCode(index + 65)}.   $e",
                                      status: !isDone
                                          ? null
                                          : answer == -1 &&
                                                  index == question.answer
                                              ? true
                                              : answer == -1 &&
                                                      index != question.answer
                                                  ? null
                                                  : answer > -1 &&
                                                          index ==
                                                              question.answer
                                                      ? true
                                                      : answer > -1 &&
                                                              index !=
                                                                  question
                                                                      .answer
                                                          ? null
                                                          : false,
                                      onTap: () {
                                        if (isDone) return;

                                        key.currentState!.animationController
                                            .stop();

                                        setState(
                                          () {
                                            answer = index;
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                if (isDone)
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: const Text("Next"),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

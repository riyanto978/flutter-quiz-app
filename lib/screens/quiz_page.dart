import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/question.dart';
import 'package:flutter_quiz_app/screens/finish_page.dart';
import 'package:flutter_quiz_app/widgets/loading_bar.dart';
import 'package:flutter_quiz_app/widgets/question_widget.dart';

class QuizPage extends StatefulWidget {
  final int rightAnswer;
  final int questionIndex;

  const QuizPage(
      {Key? key, required this.rightAnswer, required this.questionIndex})
      : super(key: key);

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
    Questions question = questions[widget.questionIndex];
    bool rightAnswer = question.answer == answer;

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
                  const SizedBox(
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
                            child: Text(question.question),
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                ...question.options.map(
                                  (
                                    e,
                                  ) {
                                    int index = question.options.indexOf(e);

                                    return questionWidget(
                                      text:
                                          "${String.fromCharCode(index + 65)}.   $e",
                                      status: cekQuestionStatus(
                                          isDone, index, question),
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        minimumSize:
                                            const Size(double.infinity, 40),
                                        backgroundColor: rightAnswer
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      onPressed: () {
                                        if ((questions.length - 1) ==
                                            widget.questionIndex) {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return FinishPage(
                                                    rightAnswer: rightAnswer
                                                        ? widget.rightAnswer + 1
                                                        : widget.rightAnswer);
                                              },
                                            ),
                                          );

                                          return;
                                        }

                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return QuizPage(
                                                  rightAnswer: rightAnswer
                                                      ? widget.rightAnswer + 1
                                                      : widget.rightAnswer,
                                                  questionIndex:
                                                      widget.questionIndex + 1);
                                            },
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            rightAnswer
                                                ? Icons.done
                                                : Icons.close,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 40,
                                          ),
                                          Expanded(
                                            child: Text(
                                              rightAnswer ? "Benar" : "Salah",
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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

  bool? cekQuestionStatus(bool isDone, int index, Questions question) {
    if (!isDone) {
      return null;
    }

    if (answer == -1 && index == question.answer) {
      return true;
    }

    if (answer == -1 && index != question.answer) {
      return null;
    }

    if (index == answer && index == question.answer) {
      return true;
    }

    if (index == answer && index != question.answer) {
      return false;
    }

    if (answer > -1 && index == question.answer) {
      return true;
    }

    if (answer > -1 && index != question.answer) {
      return null;
    }

    return false;
  }
}

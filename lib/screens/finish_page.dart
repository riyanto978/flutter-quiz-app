import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/main_page.dart';

class FinishPage extends StatefulWidget {
  final int rightAnswer;

  const FinishPage({Key? key, required this.rightAnswer}) : super(key: key);

  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(9999),
                border: Border.all(
                  color: Colors.white,
                  width: 10,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "hasil",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${widget.rightAnswer} / 5",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return const MainPage();
                        },
                      ));
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 1, color: Colors.white),
                    ),
                    child: const Text(
                      "Back To Main",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

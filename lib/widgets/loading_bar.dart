import 'package:flutter/material.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({Key? key, required this.onTimeOut}) : super(key: key);

  final Function() onTimeOut;

  @override
  State<LoadingBar> createState() => LoadingBarState();
}

class LoadingBarState extends State<LoadingBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  );

  @override
  void initState() {
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onTimeOut();
      }
    });

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Stack(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth * animationController.value,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "${(animationController.value * 10).round().toString()} seconds",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

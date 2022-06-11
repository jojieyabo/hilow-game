// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'function.dart';
import 'widgets.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  void gameFunction() {
    if (ans == "high/equal") {
      if (cardValue[guessCard]! >= cardValue[RightCard[0]]!) {
        dialogCorrect();
      } else {
        gameoverDialog();
      }
    } else if (ans == "lower") {
      if (cardValue[guessCard]! < cardValue[RightCard[0]]!) {
        dialogCorrect();
      } else {
        gameoverDialog();
      }
    }
  }

  void gameReset() {
    score = 0;
    ans = "";
    initNumberCard = Random().nextInt(52) + 1;
    RightCard = ["assets/$initNumberCard.png", back, back, back, back];
  }

  void correctGuess() {
    score++;
    RightCard.insert(0, guessCard);
    guessNumber = Random().nextInt(52) + 1;
    guessCard = "assets/$guessNumber.png";
  }

  void dialogCorrect() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("You're right"),
              content: Text("Continue?"),
              actions: [
                GestureDetector(
                  child: Text("Proceed"),
                  onTap: () {
                    setState(() {
                      correctGuess();
                      Navigator.of(context).pop(false);
                      isBack = true;
                    });
                  },
                )
              ],
            ));
  }

  void gameoverDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Game Over"),
              actions: [
                GestureDetector(
                  child: Text("Play Again"),
                  onTap: () {
                    setState(() {
                      gameReset();
                      Navigator.of(context).pop(false);
                      isBack = true;
                    });
                  },
                ),
                GestureDetector(
                  child: Text("Quit"),
                  onTap: () {
                    SystemNavigator.pop();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/bgp.jpg"),
        fit: BoxFit.fill,
      )),
      child: Column(
        children: [
          SizedBox(
            height: 60.0,
          ),
          Container(
            height: 40,
            width: 90,
            child: Center(
              child: Text(
                'Score: $score',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.red,
              width: 2.0,
            )),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Cards(RightCard[1]),
              Cards(RightCard[2]),
              Cards(RightCard[3]),
              Cards(RightCard[4]),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isBack ? Cards(back) : Cards(guessCard),
              SizedBox(
                width: 50,
              ),
              Cards(RightCard[0]),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      ans = "high/equal";
                      isBack = false;
                      gameFunction();
                    });
                  },
                  child: Buttonss('high/equal')),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      ans = "lower";
                      isBack = false;
                      gameFunction();
                    });
                  },
                  child: Buttonss('lower')),
            ],
          )
        ],
      ),
    );
  }
}

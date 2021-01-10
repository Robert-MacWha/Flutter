import 'dart:async';
import 'dart:math';

import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';

import 'barriers.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var random = new Random();

  static double birdY = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdY;
  bool gameHasStarted = false;

  double barrierXOne = 0;
  double barrierXTwo = 1;
  double barrierXThree = 2;
  double barrierYOne = 0;
  double barrierYTwo = -100;
  double barrierYThree = 75;

  double score = 0;

  double barrierSpeed = 0.004;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdY;
    });
  }

  void startGame() {
    gameHasStarted = true;
    birdY = 0;
    time = 0;
    initialHeight = 0;
    score = 0;

    barrierXOne = 0.3;
    barrierXTwo = 1.2;
    barrierXThree = 2.0;
    barrierSpeed = 0.004;

    Timer.periodic(Duration(milliseconds: 10), (timer) {
      time += 0.01;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdY = initialHeight - height;
        // Move barriers
        barrierXOne   -= barrierSpeed;
        barrierXTwo   -= barrierSpeed;
        barrierXThree -= barrierSpeed;
        barrierSpeed += 0.000001;
      });

      if (birdY > 1) {
        gameHasStarted = false;
        timer.cancel();
      }

      if (barrierXOne < -1.4) {
        barrierXOne = 1.1;
        barrierYOne = (random.nextDouble() * 200) - 100.0;
        score += 1;
      }
      if (barrierXTwo < -1.4) {
        barrierXTwo = 1.1;
        barrierYTwo = (random.nextDouble() * 200) - 100.0;
        score += 1;
      }
      if (barrierXThree < -1.4) {
        barrierXThree = 1.1;
        barrierYThree = (random.nextDouble() * 200) - 100.0;
        score += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 3,
            child: Stack(children: [
              GestureDetector(
                  onTap: () {
                    if (gameHasStarted) {
                      jump();
                    } else {
                      startGame();
                    }
                  },
                  child: AnimatedContainer(
                      alignment: Alignment(-0, birdY),
                      duration: Duration(milliseconds: 0),
                      color: Colors.blue,
                      child: MyBird())),
              Container(
                  alignment: Alignment(0, -0.3),
                  child: gameHasStarted
                      ? Text("")
                      : Text("Tap To Play",
                          style: TextStyle(color: Colors.white, fontSize: 40))),
              // Pipes
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(barrierXOne, 1.15),
                child: Barrier(size: 200.0 + barrierYOne)
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(barrierXOne, -1.15),
                child: Barrier(size: 200.0 - barrierYOne)
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(barrierXTwo, 1.15),
                child: Barrier(size: 200.0 + barrierYTwo)
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(barrierXTwo, -1.15),
                child: Barrier(size: 200 - barrierYTwo)
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(barrierXThree, 1.15),
                child: Barrier(size: 200.0 + barrierYThree)
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(barrierXThree, -1.15),
                child: Barrier(size: 200 - barrierYThree)
              ),
            ])),
        Container(
          height: 15,
          color: Colors.green,
        ),
        Expanded(
            child: Container(
                color: Colors.brown[600],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Best",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          height: 6,
                        ),
                        Text("0",
                            style: TextStyle(
                                color: Colors.grey[100], fontSize: 40))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Score",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          height: 6,
                        ),
                        Text(score.toString(),
                            style: TextStyle(
                                color: Colors.grey[100], fontSize: 40))
                      ],
                    )
                  ],
                )))
      ],
    ));
  }
}
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
class Snake extends StatefulWidget {
  const Snake({Key? key}) : super(key: key);

  @override
  State<Snake> createState() => _SnakeState();
}

class _SnakeState extends State<Snake> {

  final int squaresPerRow = 20;
  final int squaresPerCol = 40;
  final textStyle = const TextStyle(color: Colors.white, fontSize: 20);
  final randomGen = Random();

  late List<int> snakePosition;
  late int snakeDirection;
  late int foodPosition;
  late Timer timer;
  late bool isGameOver;

  @override
  void initState() {
    super.initState();
    setupGame();
  }

  void setupGame() {
    snakePosition = [45, 65, 85, 105, 125];
    snakeDirection = 20; // up
    isGameOver = false;
    generateNewFood();
    timer = Timer.periodic(const Duration(milliseconds: 400), (Timer timer) {
      updateGame();
    });
  }

  void updateGame() {
    setState(() {
      if (snakePosition.last == foodPosition) {
        // If the snake eats the food, grow the snake & generate new food.
        eatFood();
      }
      // Move the snake
      moveSnake();
      // Check collision after moving the snake.
      if (collisionDetected()) {
        endGame();
      }
    });
  }

  bool collisionDetected() {
    if (snakeDirection == -1 && snakePosition.last % squaresPerRow == 0) {
      return true; // left
    } else if (snakeDirection == 1 &&
        snakePosition.last % squaresPerRow == squaresPerRow - 1) {
      return true; // right
    } else if (snakeDirection == -squaresPerRow &&
        snakePosition.last < squaresPerRow) {
      return true; // up
    } else if (snakeDirection == squaresPerRow &&
        snakePosition.last > squaresPerRow * (squaresPerCol - 1)) {
      return true; // down
    } else if (snakePosition
        .sublist(0, snakePosition.length - 1)
        .contains(snakePosition.last)) {
      return true; // collision with itself
    }

    return false;
  }

  void generateNewFood() {
    foodPosition = randomGen.nextInt(squaresPerRow * squaresPerCol);

    while (snakePosition.contains(foodPosition)) {
      foodPosition = randomGen.nextInt(squaresPerRow * squaresPerCol);
    }
  }

  void endGame() {
    isGameOver = true;
    timer.cancel();
  }

  void eatFood() {
    // Add new head based on current direction but do not remove the tail.
    snakePosition.add(snakePosition.last + snakeDirection);
    generateNewFood();
  }

  void moveSnake() {
    // Add a new head and remove the tail.
    snakePosition.add(snakePosition.last + snakeDirection);
    snakePosition.removeAt(0);
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (snakeDirection != -20 && details.delta.dy > 0) {
                snakeDirection = squaresPerRow;
              } else if (snakeDirection != 20 && details.delta.dy < 0) {
                snakeDirection = -squaresPerRow;
              }
            },
            onHorizontalDragUpdate: (details) {
              if (snakeDirection != 1 && details.delta.dx < 0) {
                snakeDirection = -1;
              } else if (snakeDirection != -1 && details.delta.dx > 0) {
                snakeDirection = 1;
              }
            },
            child: AspectRatio(
              aspectRatio: squaresPerRow / (squaresPerCol + 5),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: squaresPerRow * squaresPerCol,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: squaresPerRow,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (snakePosition.contains(index)) {
                    return Container(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else if (index == foodPosition) {
                    return Container(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Colors.grey[900],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: isGameOver
              ? Text(
            'Game Over',
            style: textStyle,
          )
              : SizedBox.shrink(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Score: ${snakePosition.length}', style: textStyle),
              ElevatedButton(
                child: Text(
                  'New Game',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: isGameOver ? () => setupGame() : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

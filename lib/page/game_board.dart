import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/controller.dart';

class GameBoard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final gameController = watch(gameControllerProvider);

    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.7, 1.0],
            colors: [
              Colors.transparent,
              Colors.blueGrey,
              Colors.pink,
            ],
          )),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '⚪',
                            style: const TextStyle(
                              fontSize: 36,
                              fontFamily: 'emoji',
                            ),
                          ),
                          gameController.xoTurn == Xo.o
                              ? Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  height: 10,
                                  width: 45,
                                  color: gameController.isGameOver
                                      ? null
                                      : Colors.pinkAccent,
                                )
                              : Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  height: 10,
                                  width: 45,
                                ),
                          Text(
                            gameController.oScore.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 100),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '❌',
                            style: const TextStyle(
                              fontSize: 36,
                              fontFamily: 'emoji',
                            ),
                          ),
                          gameController.xoTurn == Xo.x
                              ? Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  height: 10,
                                  width: 45,
                                  color: gameController.isGameOver
                                      ? null
                                      : Colors.pinkAccent,
                                )
                              : Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  height: 10,
                                  width: 45,
                                ),
                          Text(
                            gameController.xScore.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: 400,
                  child: GridView.builder(
                      padding: EdgeInsets.all(15),
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (!gameController.isGameOver &&
                                gameController.board[index].isEmpty)
                              gameController.tapped(context, index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: gameController.isGameOver
                                  ? Colors.white30
                                  : null,
                              border: Border.all(
                                  width: 3,
                                  color: Colors.pinkAccent.withOpacity(0.5)),
                            ),
                            child: Center(
                              child: Text(
                                gameController.board[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontFamily: 'emoji',
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              color: Colors.pinkAccent,
                              textColor: Colors.white,
                              child: const Text(
                                'Next Game',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                              onPressed: gameController.clearBoard,
                            ),
                            const SizedBox(width: 75),
                            RaisedButton(
                              child: const Text(
                                'Reset',
                                style: TextStyle(fontSize: 18),
                              ),
                              padding: const EdgeInsets.all(20),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          '先手・後手は勝負ごとにランダムで決定',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          '© KATSUDON FACTORY',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

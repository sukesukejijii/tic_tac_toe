import 'package:flutter/material.dart';
import 'package:tic_tac_toe/page/game_board.dart';

import '../custom_route.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 75),
                child: Container(
                  child: const Text(
                    'TIC TAC TOE',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 300,
                child: Image.asset(
                  'assets/tictactoe.png',
                  color: Colors.pinkAccent,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Container(
                  child: const Text(
                    "(C) NANTOKA FACTORY",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.push(
                    context,
                    CustomRoute(
                      builder: (context) => GameBoard(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.grab,
                    child: Container(
                      width: 350,
                      padding: const EdgeInsets.all(20),
                      color: Colors.white10,
                      child: Center(
                        child: const Text(
                          'GAME START',
                          style: const TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

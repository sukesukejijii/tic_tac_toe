import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameControllerProvider =
    ChangeNotifierProvider.autoDispose((ref) => GameController());

enum Xo {
  x,
  o,
}

class GameController extends ChangeNotifier {
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  Xo xoTurn = Random().nextBool() ? Xo.x : Xo.o;
  bool isGameOver = false;
  int xScore = 0;
  int oScore = 0;

  void chooseRandomPlayer() {
    xoTurn = Random().nextBool() ? Xo.x : Xo.o;
    notifyListeners();
  }

  void tapped(BuildContext context, int index) {
    if (xoTurn == Xo.o) {
      board[index] = '⚪';
      checkWinner(context);
      xoTurn = Xo.x;
    } else {
      board[index] = '❌';
      checkWinner(context);
      xoTurn = Xo.o;
    }
    notifyListeners();
  }

  void showWinDialog(BuildContext context, String xO) {
    isGameOver = true;
    notifyListeners();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.pink.withOpacity(0.7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Center(
              child: Text(
                '$xO の勝ち！',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamilyFallback: ['emoji'],
                ),
              ),
            ),
          );
        });

    xO == '⚪' ? oScore++ : xScore++;
    notifyListeners();
  }

  void showDrawDialog(BuildContext context) {
    isGameOver = true;
    notifyListeners();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white70,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Center(
              child: const Text(
                '引き分け!',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        });
  }

  void checkWinner(BuildContext context) {
    if (board[0] == board[1] && board[0] == board[2] && board[0] != '') {
      showWinDialog(context, board[0]);
    } else if (board[0] == board[1] && board[0] == board[2] && board[0] != '') {
      showWinDialog(context, board[0]);
    } else if (board[0] == board[3] && board[0] == board[6] && board[0] != '') {
      showWinDialog(context, board[0]);
    } else if (board[8] == board[7] && board[8] == board[6] && board[8] != '') {
      showWinDialog(context, board[8]);
    } else if (board[8] == board[5] && board[8] == board[2] && board[8] != '') {
      showWinDialog(context, board[8]);
    } else if (board[1] == board[4] && board[1] == board[7] && board[1] != '') {
      showWinDialog(context, board[1]);
    } else if (board[3] == board[4] && board[3] == board[5] && board[3] != '') {
      showWinDialog(context, board[3]);
    } else if (board[0] == board[4] && board[0] == board[8] && board[0] != '') {
      showWinDialog(context, board[0]);
    } else if (board[2] == board[4] && board[2] == board[6] && board[2] != '') {
      showWinDialog(context, board[2]);
    } else if (board.indexOf('') == -1) {
      showDrawDialog(context);
    }
  }

  void clearBoard() {
    isGameOver = false;
    notifyListeners();

    board.setAll(0, ['', '', '', '', '', '', '', '', '']);
    notifyListeners();

    chooseRandomPlayer();
  }
}

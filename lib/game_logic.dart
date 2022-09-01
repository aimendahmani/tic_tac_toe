import 'dart:math';

import 'package:flutter/material.dart';

class Player {
  static var PlayerX = [];
  static var PlayerO = [];
}

extension containsAllExtension on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null)
      return contains(x) && contains(y);
    else
      return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  void playGame(int index, String activePlayer) {
    activePlayer == 'X' ? Player.PlayerX.add(index) : Player.PlayerO.add(index);
  }

  String checkWinner() {
    String winner = "";
    if (Player.PlayerX.containsAll(0, 1, 2) ||
        Player.PlayerX.containsAll(3, 4, 5) ||
        Player.PlayerX.containsAll(6, 7, 8) ||
        Player.PlayerX.containsAll(0, 3, 6) ||
        Player.PlayerX.containsAll(1, 4, 7) ||
        Player.PlayerX.containsAll(2, 5, 8) ||
        Player.PlayerX.containsAll(0, 4, 8) ||
        Player.PlayerX.containsAll(2, 4, 6))
      winner = "X";
    else if (Player.PlayerO.containsAll(0, 1, 2) ||
        Player.PlayerO.containsAll(3, 4, 5) ||
        Player.PlayerO.containsAll(6, 7, 8) ||
        Player.PlayerO.containsAll(0, 3, 6) ||
        Player.PlayerO.containsAll(1, 4, 7) ||
        Player.PlayerO.containsAll(2, 5, 8) ||
        Player.PlayerO.containsAll(0, 4, 8) ||
        Player.PlayerO.containsAll(2, 4, 6)) winner = "O";

    return winner;
  }

  void autoPlay(String activePlayer) {
    int index = 0;
    List emptyCells = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.PlayerX.contains(i) || Player.PlayerO.contains(i)))
        emptyCells.add(i);
    }
    List currentPlayer, otherPlayer;
    if (activePlayer == "X") {
      currentPlayer = Player.PlayerX;
      otherPlayer = Player.PlayerO;
    } else {
      currentPlayer = Player.PlayerO;
      otherPlayer = Player.PlayerX;
    }
//attack-start
    if (currentPlayer.containsAll(0, 1) && emptyCells.contains(2))
      index = 2;
    else if (currentPlayer.containsAll(3, 4) && emptyCells.contains(5))
      index = 5;
    else if (currentPlayer.containsAll(6, 7) && emptyCells.contains(8))
      index = 8;
    else if (currentPlayer.containsAll(0, 3) && emptyCells.contains(6))
      index = 6;
    else if (currentPlayer.containsAll(1, 4) && emptyCells.contains(7))
      index = 7;
    else if (currentPlayer.containsAll(2, 5) && emptyCells.contains(8))
      index = 8;
    else if (currentPlayer.containsAll(0, 4) && emptyCells.contains(8))
      index = 8;
    else if (currentPlayer.containsAll(2, 4) && emptyCells.contains(6))
      index = 6;
//attack-center
    else if (currentPlayer.containsAll(0, 2) && emptyCells.contains(1))
      index = 1;
    else if (currentPlayer.containsAll(3, 5) && emptyCells.contains(4))
      index = 4;
    else if (currentPlayer.containsAll(6, 8) && emptyCells.contains(7))
      index = 7;
    else if (currentPlayer.containsAll(0, 6) && emptyCells.contains(3))
      index = 3;
    else if (currentPlayer.containsAll(1, 7) && emptyCells.contains(4))
      index = 4;
    else if (currentPlayer.containsAll(2, 8) && emptyCells.contains(5))
      index = 5;
    else if (currentPlayer.containsAll(0, 8) && emptyCells.contains(4))
      index = 4;
    else if (currentPlayer.containsAll(2, 6) && emptyCells.contains(4))
      index = 4;
//attack-end
    else if (currentPlayer.containsAll(2, 1) && emptyCells.contains(0))
      index = 0;
    else if (currentPlayer.containsAll(5, 4) && emptyCells.contains(3))
      index = 3;
    else if (currentPlayer.containsAll(8, 7) && emptyCells.contains(6))
      index = 6;
    else if (currentPlayer.containsAll(6, 3) && emptyCells.contains(0))
      index = 0;
    else if (currentPlayer.containsAll(7, 4) && emptyCells.contains(1))
      index = 1;
    else if (currentPlayer.containsAll(8, 5) && emptyCells.contains(2))
      index = 2;
    else if (currentPlayer.containsAll(8, 4) && emptyCells.contains(0))
      index = 0;
    else if (currentPlayer.containsAll(6, 4) && emptyCells.contains(2))
      index = 2;
    //defense-start
    else if (otherPlayer.containsAll(0, 1) && emptyCells.contains(2))
      index = 2;
    else if (otherPlayer.containsAll(3, 4) && emptyCells.contains(5))
      index = 5;
    else if (otherPlayer.containsAll(6, 7) && emptyCells.contains(8))
      index = 8;
    else if (otherPlayer.containsAll(0, 3) && emptyCells.contains(6))
      index = 6;
    else if (otherPlayer.containsAll(1, 4) && emptyCells.contains(7))
      index = 7;
    else if (otherPlayer.containsAll(2, 5) && emptyCells.contains(8))
      index = 8;
    else if (otherPlayer.containsAll(0, 4) && emptyCells.contains(8))
      index = 8;
    else if (otherPlayer.containsAll(2, 4) && emptyCells.contains(6))
      index = 6;
//defense-center
    else if (otherPlayer.containsAll(0, 2) && emptyCells.contains(1))
      index = 1;
    else if (otherPlayer.containsAll(3, 5) && emptyCells.contains(4))
      index = 4;
    else if (otherPlayer.containsAll(6, 8) && emptyCells.contains(7))
      index = 7;
    else if (otherPlayer.containsAll(0, 6) && emptyCells.contains(3))
      index = 3;
    else if (otherPlayer.containsAll(1, 7) && emptyCells.contains(4))
      index = 4;
    else if (otherPlayer.containsAll(2, 8) && emptyCells.contains(5))
      index = 5;
    else if (otherPlayer.containsAll(0, 8) && emptyCells.contains(4))
      index = 4;
    else if (otherPlayer.containsAll(2, 6) && emptyCells.contains(4))
      index = 4;
//defense-end
    else if (otherPlayer.containsAll(2, 1) && emptyCells.contains(0))
      index = 0;
    else if (otherPlayer.containsAll(5, 4) && emptyCells.contains(3))
      index = 3;
    else if (otherPlayer.containsAll(8, 7) && emptyCells.contains(6))
      index = 6;
    else if (otherPlayer.containsAll(6, 3) && emptyCells.contains(0))
      index = 0;
    else if (otherPlayer.containsAll(7, 4) && emptyCells.contains(1))
      index = 1;
    else if (otherPlayer.containsAll(8, 5) && emptyCells.contains(2))
      index = 2;
    else if (otherPlayer.containsAll(8, 4) && emptyCells.contains(0))
      index = 0;
    else if (otherPlayer.containsAll(6, 4) && emptyCells.contains(2))
      index = 2;
    else {
      var random = new Random();
      int randomIndex = random.nextInt(emptyCells.length);
      index = emptyCells[randomIndex];
    }

    playGame(index, activePlayer);
  }
}

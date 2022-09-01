import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_logic.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activePlayer = "X";

  bool gameOver = false;

  int turn = 0;

  String result = "";
  String winner = "";

  Game game = new Game();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MediaQuery.of(context).orientation == Orientation.portrait
                ? Column(
                    children: [
                      SwitchListTile.adaptive(
                        value: isSwitched,
                        onChanged: (newval) {
                          setState(() {
                            isSwitched = newval;
                          });
                        },
                        title: const Text(
                          "Turn On/Off two player",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "It's $activePlayer turn",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 1.0,
                          children: List.generate(
                            9,
                            (index) => InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => _onTap(index),
                              splashColor: Theme.of(context).splashColor,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    Player.PlayerX.contains(index)
                                        ? 'X'
                                        : Player.PlayerO.contains(index)
                                            ? 'O'
                                            : '',
                                    style: TextStyle(
                                      color: Player.PlayerX.contains(index)
                                          ? Colors.white
                                          : Colors.pink,
                                      fontSize: 60,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Theme.of(context).shadowColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "$result",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            Player.PlayerO.clear();
                            Player.PlayerX.clear();
                            activePlayer = "X";
                            result = "";
                            gameOver = false;

                            turn = 0;
                          });
                        },
                        icon: Icon(Icons.replay),
                        label: Text(
                          "Repeat The Game",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "$result",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                Player.PlayerO.clear();
                                Player.PlayerX.clear();
                                activePlayer = "X";

                                gameOver = false;
                                result = "";
                                winner = "";
                                turn = 0;
                              });
                            },
                            icon: Icon(Icons.replay),
                            label: Text(
                              "Repeat The Game",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          child: GridView.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            childAspectRatio: 1.0,
                            children: List.generate(
                              9,
                              (index) => InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {},
                                splashColor: Theme.of(context).splashColor,
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      Player.PlayerX.contains(index)
                                          ? 'X'
                                          : Player.PlayerO.contains(index)
                                              ? 'O'
                                              : '',
                                      style: TextStyle(
                                        color: Player.PlayerX.contains(index)
                                            ? Colors.white
                                            : Colors.pink,
                                        fontSize: 60,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Theme.of(context).shadowColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }

  _onTap(int index) {
    if (!Player.PlayerX.contains(index) &&
        !Player.PlayerO.contains(index) &&
        !gameOver) {
      game.playGame(index, activePlayer);
      setState(() {
        turn++;
        winner = game.checkWinner();
        if (winner != "") {
          result = "Result : winner is $winner";
          gameOver = true;
        } else if (turn == 9) {
          gameOver = true;
          result = "Result : it's draw";
        }
        activePlayer == 'X' ? activePlayer = 'O' : activePlayer = 'X';
      });
      if (!isSwitched && !gameOver) {
        game.autoPlay(activePlayer);
        setState(() {
          turn++;
          winner = game.checkWinner();
          if (winner != "") {
            result = "Result : winner is $winner";
            gameOver = true;
          } else if (turn == 9) {
            gameOver = true;
            result = "Result : it's draw";
          }
          activePlayer == 'X' ? activePlayer = 'O' : activePlayer = 'X';
        });
      }
    }
  }
}

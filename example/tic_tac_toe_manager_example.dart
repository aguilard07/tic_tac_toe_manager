import 'dart:io';

import '../lib/src/tic_tac_toe_manager_base.dart';

void main() {
  // ignore: omit_local_variable_types
  TicTacToeManager ticTacToeManager = TicTacToeManager();
  bool isTied = false;
  bool isWon = false;
  String currentPlayer;
  Map<String, dynamic> gameData;

  gameData = ticTacToeManager.startGame(false);

  while (!isWon && !isTied) {
    currentPlayer = gameData['nextPlayer'];
    stdout.writeln('The current player is: ${currentPlayer}');
    stdout.writeln('Current state of the board:');
    ticTacToeManager.printBoardState();
    stdout.writeln('Please introduce the index where you want to play:');

    //Reading the user input (next play).
    try {
      int index = int.parse(stdin
          .readLineSync()!); //Reads the user input and validates that is not null and an int value.
      gameData = ticTacToeManager.update(currentPlayer, index, false);

      print(gameData);

      isWon = gameData['isWon'];
      isTied = gameData['isTied'];

      if (isWon) {
        stdout.writeln('The winner player is ${gameData['winnerPlayer']}');
        stdout.writeln('The winner play is: ${gameData['winnerLine']}');
      } else if (isTied) {
        stdout.writeln('The game is tied.');
      }
    } catch (_) {
      stdout
          .writeln('Please insert a correct value. Must be an int between 0-8');
    }
  }
}

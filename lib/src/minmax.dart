import 'dart:math';

class Minmax {
  static void printBoardState(Map<int, String> boardState) {
    print(
        '|${boardState[0] ?? '_'}     ${boardState[1] ?? '_'}     ${boardState[2] ?? '_'}|');
    print(
        '|${boardState[3] ?? '_'}     ${boardState[4] ?? '_'}     ${boardState[5] ?? '_'}|');
    print(
        '|${boardState[6] ?? '_'}     ${boardState[7] ?? '_'}     ${boardState[8] ?? '_'}|');
  }

  static int minmax(Map<int, String> boardState, int depth,
      String currentPlayer, List<List<int>> winnerLines) {
    var score = calculateFitness(boardState, winnerLines);

    var best = 0;
    if (score == 10 || score == -10) {
      return score;
    }

    if (!isMovesLeft(boardState)) {
      score = 0;
      return score;
    }

    //print('Player: $currentPlayer');
    if (currentPlayer == 'X') {
      best = -1000;
    } else if (currentPlayer == 'O') {
      best = 1000;
    }

    for (var i = 0; i < 9; i++) {
      if (!boardState.containsKey(i)) {
        boardState.putIfAbsent(i, () => currentPlayer);
        print('Current Player: $currentPlayer');
        switch (currentPlayer) {
          case 'X':
            var value = minmax(boardState, depth + 1, 'O', winnerLines) - depth;
            best = max(best, value);
            print('Value: $value, best: $best');
            break;
          case 'O':
            var value = minmax(boardState, depth + 1, 'X', winnerLines) + depth;

            best = min(best, value);
            print('Value: $value, best: $best');
            break;
          default:
        }
        boardState.remove(i);
      }
    }
    print('best: $best');
    return best;
  }

  static bool isMovesLeft(Map<int, String> boardState) {
    return !(boardState.length == 9);
  }

  static int calculateFitness(
      Map<int, String> boardState, List<List<int>> winnerLines) {
    var playerMarks;
    var score = 0;
    var isWon = false;

    var players = ['X', 'O'];

    for (var player in players) {
      playerMarks = [];
      boardState.forEach((key, value) {
        if (value == player) playerMarks.add(key);
      });
      for (var line in winnerLines) {
        // ignore: omit_local_variable_types
        isWon = line.every((element) => playerMarks.contains(element));

        //Si hay ganador.
        if (isWon) {
          if (player == 'X') {
            score = 10;
          } else {
            score = -10;
          }
          break;
        }
      }
    }

    return score;
  }

  static int findBestMove(Map<int, String> boardState, String currentPlayer,
      List<List<int>> winnerLines) {
    var bestVal;
    var bestMove = -1;
    var nextPlayer;

    if (currentPlayer == 'X') {
      nextPlayer = 'O';
      bestVal = -1000;
    } else if (currentPlayer == 'O') {
      nextPlayer = 'X';
      bestVal = 1000;
    }
    for (var move = 0; move < 9; move++) {
      print('Testing move = $move');

      if (!boardState.containsKey(move)) {
        print('move $move is possible');
        boardState.putIfAbsent(move, () => currentPlayer);
        printBoardState(boardState);
        var moveVal = minmax(boardState, 0, nextPlayer, winnerLines);

        print('Move value: $moveVal');
        if (currentPlayer == 'O') {
          if (moveVal < bestVal) {
            bestVal = moveVal;
            bestMove = move;
          }
        } else if (currentPlayer == 'X') {
          if (moveVal > bestVal) {
            bestVal = moveVal;
            bestMove = move;
          }
        }

        boardState.remove(move);
        // print('----------------------------------------------------');
      }
      /*else {
        print('move $move is NOT possible');
        print('----------------------------------------------------');
      }*/
    }
    return bestMove;
  }
}

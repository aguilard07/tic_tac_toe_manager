class Minmax {
  bool isMovesLeft(Map<int, String> boardState) {
    return (boardState.length < 10);
  }

  int calculateFitness(Map<int, String> boardState, String currentPlayer,
      List<List<int>> winnerLines) {
    var playerMarks = [];
    var score = 0;

    boardState.forEach((key, value) {
      if (value == currentPlayer) playerMarks.add(key);
    });

    for (var line in winnerLines) {
      // ignore: omit_local_variable_types
      bool isWon = line.every((element) => playerMarks.contains(element));

      //Si hay ganador.
      if (isWon) {
        if (currentPlayer == 'X') {
          score = 10;
        } else {
          score = -10;
        }
        break;
      }
    }

    return score;
  }
}

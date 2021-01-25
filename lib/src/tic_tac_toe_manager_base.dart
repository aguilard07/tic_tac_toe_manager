import 'tic_tac_toe_utils.dart';

///Manager that handles the procedures related to a Tic Tac Toe Match.
///It handles the turns, calculation of winners and ties and updates the
///state of the board.

class TicTacToeManager {
  Map<int, String> _boardState = <int, String>{}; //Board's current state.
  bool _isTied = false; //Tied state
  bool _isWon = false;
  bool _isLastPlayValid = false; //Checks if the last play is valid.
  String _winnerPlayer = ''; //Winner state
  String _nextPlayer = 'X';
  List<int> _winnerLine = [];

  Map get getBoardState => _boardState;

  void printBoardState() {
    print(
        '|${_boardState[0] ?? 'A'}     ${_boardState[1] ?? 'A'}     ${_boardState[2] ?? 'A'}|');
    print(
        '|${_boardState[3] ?? 'A'}     ${_boardState[4] ?? 'A'}     ${_boardState[5] ?? 'A'}|');
    print(
        '|${_boardState[6] ?? 'A'}     ${_boardState[7] ?? 'A'}     ${_boardState[8] ?? 'A'}|');
  }

  Map<String, dynamic> update(
      String currentPlayer, int index, bool printBoard) {
    _isLastPlayValid = false;

    // 1. Chequear número de jugadas.
    if (_boardState.length < 9) {
      // 2. Si el número de jugadas es menor a 9 inserta la jugada en el tablero.
      _isLastPlayValid = _updateBoard(currentPlayer, index);
      // 3. Determine if the is a winner, taking into account the last play.

      //Note: It's required at least 5 plays to have a winner.
      if (_isLastPlayValid) {
        if (_boardState.length >= 5) {
          _calculateWinner(currentPlayer);
          //4.If 8 plays has been made and there's no winner, so the game is tied.
          if (!_isWon && _boardState.length == 9) _isTied = true;
        }
        //5. Determining next player turn.
        _determineNextPlayer(currentPlayer);
      }
    }
    return gameDataToJson();
  }

  void _calculateWinner(String currentPlayer) {
    // ignore: omit_local_variable_types
    List<int> playerMarks = [];

    //1. Obtener los índices donde player ha jugado.
    _boardState.forEach((key, value) {
      if (value == currentPlayer) playerMarks.add(key);
    });

    //2. Calcular si hay ganador.

    for (List<int> line in winnerLists) {
      _isWon = line.every((element) => playerMarks.contains(element));
      //Si hay ganador.
      if (_isWon) {
        _winnerPlayer = currentPlayer;
        _winnerLine = line;
        break;
      }
    }
  }

  /*
    Each play is represented by two values a player mark ('X' || 'O')
    and an index.
    The play is valid only if the mark is X or O and the index is positive and
    between the range [0,8]
  */
  bool _updateBoard(String player, int index) {
    if (player == _nextPlayer && index.abs() < 9) {
      if (_boardState.containsKey(index)) {
        return false;
      }
      _boardState.putIfAbsent(index, () => player);
      return true;
    } else {
      return false;
    }
  }

  void _determineNextPlayer(String currentPlayer) {
    currentPlayer == 'X' ? _nextPlayer = 'O' : _nextPlayer = 'X';
  }

  Map<String, dynamic> startGame(bool printBoard) {
    _nextPlayer = 'X';
    _isWon = false;
    _isTied = false;
    _winnerLine = [];
    _winnerPlayer = '';
    _boardState.clear();
    if (printBoard) printBoardState();
    return gameDataToJson();
  }

  /*
      {
        "isLastPlayValid": true,
        "nextPlayer": 'X',
        "isTied": false,
        "isWon": false,
        "winnerPlayer": 'O',
        "winnlerLine": [0, 1 ,2]
      }
    
    */

  Map<String, dynamic> gameDataToJson() => {
        'isLastPlayValid': _isLastPlayValid,
        'nextPlayer': _nextPlayer,
        'isTied': _isTied,
        'isWon': _isWon,
        'winnerPlayer': _winnerPlayer,
        'winnerLine': _winnerLine
      };
}

import 'package:tic_tac_toe_manager/src/tic_tac_toe_utils.dart';

///Manager that handles the procedures related to a Tic Tac Toe Match.
///It handles the turns, calculation of winners and ties and updates the
///state of the board.

//TODO: Logic of tie.
//TODO: validatePlayer method.

class TicTacToeManager {
  Map<int, String> _boardState; //Board's current state.

  bool _isTied; //Tied state
  bool _isWon;
  bool _isLastPlayValid; //Checks if the last play is valid.
  String _winnerPlayer; //Winner state
  String _nextPlayer;

  List<int> _winnerLine;

  TicTacToeManager() {
    _boardState = <int, String>{};
    _isTied = false;
  }

  Map get getBoardState => _boardState;

  void printBoardState() {
    print(_boardState);
  }

  void update(String currentPlayer, int index) {
    _isLastPlayValid = false;

    // 1. Chequear número de jugadas.
    if (_boardState.length < 9) {
      // 2. Si el número de jugadas es menor a 9 inserta la jugada en el tablero.
      _isLastPlayValid = _updateBoard(currentPlayer, index);
      // 3. Determine if the is a winner, taking into account the last play.

      //It required at least 5 plays to have a winner.
      if (_isLastPlayValid) {
        if (_boardState.length >= 5) {
          _calculateWinner(currentPlayer);

          //4.If 8 plays has been made and there's no winner, so the game is tied.
          if (!_isWon && _boardState.length == 8) _isTied = true;
        }
        //5. Determining next player turn.
        _determineNextPlayer(currentPlayer);
      }
    }

    //TODO: retornar json

    //Si no hay ganador, ni empate, devuelve el siguiente jugador.
  }

  void _calculateWinner(String currentPlayer) {
    // ignore: omit_local_variable_types
    List<int> playerMarks = [];

    //1. Obtener los índices donde player ha jugado.
    _boardState.forEach((key, value) {
      if (value == currentPlayer) playerMarks.add(key);
    });

    print('El jugador es $currentPlayer');
    print('Jugadas: $playerMarks');

    //2. Calcular si hay ganador.

    for (List line in winnerLists) {
      _isWon = line.every((element) => playerMarks.contains(element));
      //Si hay ganador.
      if (_isWon) {
        _winnerPlayer = currentPlayer;
        _winnerLine = line;
        break;
      }

      print('Winner player: $_winnerPlayer');
      print('Winner line: $_winnerLine');
    }
  }

  /*
    La jugada está representada por un index y una marca (Mark)
    Actualiza la marca del index solamente si previamente no se ha realizado una
    jugada en ese index.
  
    Retorna true si la jugada es válida, false caso contrario
  */
  bool _updateBoard(String player, int index) {
    if (_boardState.containsKey(index)) {
      return false;
    }

    _boardState.putIfAbsent(index, () => player);
    return true;
  }

  void _determineNextPlayer(String currentPlayer) {
    _nextPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }

  void restartGame() {
    _nextPlayer = 'X';
    _isWon = false;
    _isTied = false;
    _winnerLine = null;
    _winnerPlayer = null;
    _boardState.clear();
  }

  /*
      {
        "isLastPlayValid": true,
        "nextPlayer": Mark.PlayerO,
        "isTied": false,
        "isWon": false,
        "winnerPlayer": PlayerX,
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

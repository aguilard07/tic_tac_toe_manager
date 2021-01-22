import 'package:tic_tac_toe_manager/src/tic_tac_toe_utils.dart';

///Manager that handles the procedures related to a Tic Tac Toe Match.
///It handles the turns, calculation of winners and ties and updates the
///state of the board.

class TicTacToeManager {
  Map<int, String> _boardState; //Board's current state.

  bool _isTied; //Tied state
  bool _isWon;
  bool _lastPlayedValid; //Checks if the last play is valid.
  String _winnerPlayer; //Winner state

  List<int> _winnerLine;

  TicTacToeManager() {
    _boardState = <int, String>{};
    _isTied = false;
  }

  Map get getBoardState => _boardState;

  void printBoardState() {
    print(_boardState);
  }

  void update(String player, int index) {
    _lastPlayedValid = false;
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
    // 1. Chequear número de jugadas.
    if (_boardState.length < 9) {
      // 2. Si el número de jugadas es menor a 9 inserta la jugada en el tablero.
      _lastPlayedValid = _updateBoard(player, index);
    }
    // 3. Calcula si hay un ganador teniendo en cuenta la última jugada.
    _calculateWinner(player);
    // 4. Si no hay un ganador y se han realizado 8 jugadas, entonces hay un empate.

    //Si no hay ganador, ni empate, devuelve el siguiente jugador.
  }

  void _calculateWinner(String player) {
    // ignore: omit_local_variable_types
    List<int> playerMarks = [];

    //1. Obtener los índices donde player ha jugado.
    _boardState.forEach((key, value) {
      if (value == player) playerMarks.add(key);
    });

    print('El jugador es $player');
    print('Jugadas: $playerMarks');

    //2. Calcular si hay ganador.

    //Se requieren al menos tres jugadas para ganar
    if (playerMarks.length >= 3) {
      for (List line in winnerLists) {
        _isWon = line.every((element) => playerMarks.contains(element));
        //Si hay ganador.
        if (_isWon) {
          _winnerPlayer = player;
          _winnerLine = line;
          break;
        }
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
}

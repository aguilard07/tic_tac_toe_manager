import 'package:tic_tac_toe_manager/tic_tac_toe_manager.dart';

void main() {
  // ignore: omit_local_variable_types
  TicTacToeManager ticTacToeManager = TicTacToeManager();

  /*print(ticTacToeManager.getBoardState);*/

  ticTacToeManager.update('X', 0);
  ticTacToeManager.update('O', 4);
  ticTacToeManager.update('X', 1);
  ticTacToeManager.update('O', 8);
  ticTacToeManager.update('X', 2);
  /* ticTacToeManager.update('O', 2);
  ticTacToeManager.update('X', 5);
  ticTacToeManager.update('O', 3);
  ticTacToeManager.update('X', 7);*/
}

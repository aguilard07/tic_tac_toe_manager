import 'package:tic_tac_toe_manager/src/tic_tac_toe_utils.dart';
import 'package:tic_tac_toe_manager/tic_tac_toe_manager.dart';

void main() {
  // ignore: omit_local_variable_types
  TicTacToeManager ticTacToeManager = TicTacToeManager();

  /*print(ticTacToeManager.getBoardState);*/

  ticTacToeManager.update(Mark.PlayerX, 0);
  ticTacToeManager.update(Mark.PlayerO, 1);
  ticTacToeManager.update(Mark.PlayerX, 4);
  ticTacToeManager.update(Mark.PlayerO, 8);
  ticTacToeManager.update(Mark.PlayerX, 6);
  ticTacToeManager.update(Mark.PlayerO, 2);
  ticTacToeManager.update(Mark.PlayerX, 5);
  ticTacToeManager.update(Mark.PlayerO, 3);
  ticTacToeManager.update(Mark.PlayerX, 7);
}

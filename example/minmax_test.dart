import 'package:tic_tac_toe_manager/src/minmax.dart';
import 'package:tic_tac_toe_manager/src/tic_tac_toe_utils.dart';

Map<int, String> board01 = {0: 'X', 2: 'O', 3: 'X', 4: 'O', 5: 'X'};
Map<int, String> board02 = {0: 'X', 2: 'O', 3: 'X'};
Map<int, String> board03 = {0: 'X', 4: 'O', 8: 'X', 6: 'O'};
Map<int, String> board04 = {0: 'X', 4: 'O', 8: 'X', 6: 'O', 2: 'X'};

void main(List<String> args) {
  print('---------------------Begin test---------------------');
  /*var test01 = Minmax.findBestMove(board01, 'O', winnerLists);
  print('Test 01 : the best move is: $test01'); //Must be 6*/

  /* var test02 = Minmax.findBestMove(board02, 'O', winnerLists);
  print('Test 02 : the best move is: $test02'); //Must be 6*/

  var test03 = Minmax.findBestMove(board03, 'X', winnerLists);
  print('Test 03 : the best move is: $test03'); //Must be 2*/

  var test04 = Minmax.findBestMove(board04, 'O', winnerLists);
  print('Test 04 : the best move is: $test04'); //Must be 1  or 5*/
}

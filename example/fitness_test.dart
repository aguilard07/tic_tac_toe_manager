import 'package:tic_tac_toe_manager/src/minmax.dart';
import 'package:tic_tac_toe_manager/src/tic_tac_toe_utils.dart';

Map<int, String> data1 = {0: 'X', 2: 'X', 6: 'O', 7: 'X', 8: 'O'};

Map<int, String> data2 = {
  0: 'X',
  2: 'O',
  3: 'X',
  4: 'O',
  6: 'X',
  7: 'O',
  8: 'X'
};

Map<int, String> data3 = {0: 'X', 2: 'O', 3: 'X', 4: 'O', 6: 'O', 8: 'X'};

void main() {
  var result1 = Minmax.calculateFitness(data1, winnerLists); //Must return 0

  var result2 = Minmax.calculateFitness(data2, winnerLists); //Must return 10

  var result3 = Minmax.calculateFitness(data3, winnerLists); //Must return -10

  print('Test 01: $result1');
  print('Test 02: $result2');
  print('Test 03: $result3');
}

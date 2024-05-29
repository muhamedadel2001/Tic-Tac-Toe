import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utilits/helper_function.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  List<dynamic> board = ['', '', '', '', '', '', '', '', ''];
  List<String> ss = [];
  bool winner = false;
  bool isX = true;
  int counter = 0;
  bool easy = true;
  int temp = -1;

  void putCharMultiPlayer(int index, BuildContext context) {
    if (kDebugMode) {
      print('choose number for X');
    }
    if (board[index] == 'X' || board[index] == 'O') {
      if (kDebugMode) {
        print('This Number Is Already Token ');
      }
    } else {
      ss.add(index.toString());
      isX == true ? board[index] = 'X' : board[index] = 'O';
      isX = !isX;
      checkRow(board);
      checkCross(board);
      checkColumn(board);
      counter++;
      emit(AddToBoard());
    }
    if (winner == true) {
      emit(EndGameWin());
      Helper.awesomeDialog(context, ' ${board[index]} Won!');
      if (kDebugMode) {
        print('Congratulations ${board[index]} Won !');
      }
    } else {
      if (counter == 9) {
        emit(EndGameDraw());
        Helper.awesomeDialog(context, 'Match Draw!');
        if (kDebugMode) {
          print('Match draw!');
        }
      }
    }
  }

  void putCharForComputer(BuildContext context) {
    generateRandom();
    var choose = generateRandom();
    var choose2 = int.parse(choose);
    board[choose2] = 'O';
    ss.add(choose);
    checkRow(board);
    checkCross(board);
    checkColumn(board);
    counter++;
    emit(AddToBoard());
    if (winner == true) {
      emit(EndGameWin());
      Helper.awesomeDialog(context, 'O Won!');
      if (kDebugMode) {
        print('Congratulations O Won !');
      }
    } else {
      if (counter == 9) {
        emit(EndGameDraw());
        Helper.awesomeDialog(context, 'Match Draw!');
        if (kDebugMode) {
          print('Match draw!');
        }
      }
    }
  }

  void putCharSinglePlayer(int index, BuildContext context) {
    if (easy) {
      if (kDebugMode) {
        print('choose number for X');
      }
      if (board[index] == 'X' || board[index] == 'O') {
        if (kDebugMode) {
          print('This Number Is Already Token ');
        }
      } else {
        ss.add(index.toString());
        board[index] = 'X';
        checkRow(board);
        checkCross(board);
        checkColumn(board);
        counter++;

        emit(AddToBoard());
      }
      if (winner == true) {
        emit(EndGameWin());
        Helper.awesomeDialog(context, 'X Won!');
        if (kDebugMode) {
          print('Congratulations ${board[index]} Won !');
        }
      } else {
        if (counter == 9) {
          emit(EndGameDraw());
          Helper.awesomeDialog(context, 'Match Draw!');
          if (kDebugMode) {
            print('Match draw!');
          }
        } else {
          if (counter % 2 != 0) {
            putCharForComputer(context);
          }
        }
      }
    } else {
      if (kDebugMode) {
        print('choose number for X');
      }
      if (board[index] == 'X' || board[index] == 'O') {
        if (kDebugMode) {
          print('This Number Is Already Token ');
        }
      } else {
        ss.add(index.toString());
        board[index] = 'X';
        checkRow(board);
        checkCross(board);
        checkColumn(board);
        counter++;
        emit(AddToBoard());
      }
      if (winner == true) {
        emit(EndGameWin());
        Helper.awesomeDialog(context, ' ${board[index]} Won!');
        if (kDebugMode) {
          print('Congratulations ${board[index]} Won !');
        }
      } else {
        if (counter == 9) {
          emit(EndGameDraw());
          Helper.awesomeDialog(context, 'Match Draw!');
          if (kDebugMode) {
            print('Match draw!');
          }
        } else {
          if (counter % 2 != 0) {
            if (counter == 1) {
              if (board[4] == '') {
                ss.add('4');
                board[4] = 'O';
              } else {
                ss.add('0');
                board[0] = 'O';
              }
              counter++;
              emit(AddToBoard());
            } else {
              checkColumnForPlay(board);
              checkRowForPlay(board);
              checkDiagonalForPlay(board);
              if (winner == true) {
                Helper.awesomeDialog(context, 'O Won!');
                if (kDebugMode) {
                  print('Congratulations O Won !');
                }
              } else {
                if (temp != -1) {
                  counter++;
                  ss.add(temp.toString());
                  board[temp] = 'O';
                  temp = -1;
                } else {
                  generateRandom();
                  var choose = generateRandom();
                  var choose2 = int.parse(choose);
                  board[choose2] = 'O';
                  ss.add(choose);
                  counter++;
                }
              }
            }
          }
        }
      }
    }
  }

  String generateRandom() {
    var random = Random().nextInt(10).toString();
    if (random == '9') {
      return generateRandom();
    } else {
      if (ss.contains(random)) {
        return generateRandom();
      } else {
        emit(GetRandom());
        return random;
      }
    }
  }

  void checkColumn(List<dynamic> board) {
    if (board[0] == board[3] && board[0] == board[6] && board[0] != '') {
      winner = true;
    } else if (board[1] == board[4] && board[1] == board[7] && board[1] != '') {
      winner = true;
    } else if (board[2] == board[5] && board[2] == board[8] && board[2] != '') {
      winner = true;
    }
  }

  void checkRow(List<dynamic> board) {
    if (board[0] == board[1] && board[0] == board[2] && board[0] != '') {
      winner = true;
    } else if (board[3] == board[4] && board[3] == board[5] && board[5] != '') {
      winner = true;
    } else if (board[6] == board[7] && board[6] == board[8] && board[8] != '') {
      winner = true;
    }
  }

  void checkCross(List<dynamic> board) {
    if (board[0] == board[4] && board[0] == board[8] && board[0] != '') {
      winner = true;
    } else if (board[2] == board[4] && board[2] == board[6] && board[2] != '') {
      winner = true;
    }
  }

  void resetGame() {
    board = ['', '', '', '', '', '', '', '', ''];
    winner = false;
    counter = 0;
    ss = [];
    isX = true;
    emit(ResetGame());
  }

  void changeLevel() {
    easy = !easy;
    emit(ChangeLevelMode());
  }

  void checkColumnForPlay(List<dynamic> board) {
    if (board[0] == board[6] && board[3] == '') {
      if (board[0] == 'O') {
        board[3] = 'O';
        ss.add('3');
        winner = true;
      } else {
        if (board[0] == 'X') temp = 3;
      }
    }
    if (board[0] == board[3] && board[6] == '') {
      if (board[0] == 'O') {
        board[6] = 'O';
        ss.add('6');
        winner = true;
      } else {
        if (board[0] == 'X') temp = 6;
      }
    }
    if (board[6] == board[3] && board[0] == '') {
      if (board[6] == 'O') {
        board[0] = 'O';
        ss.add('0');
        winner = true;
      } else {
        if (board[6] == 'X') temp = 0;
      }
    }
    if (board[1] == board[4] && board[7] == '') {
      if (board[1] == 'O') {
        board[7] = 'O';
        ss.add('7');
        winner = true;
      } else {
        if (board[1] == 'X') temp = 7;
      }
    }
    if (board[1] == board[7] && board[4] == '') {
      if (board[1] == 'O') {
        board[4] = 'O';
        ss.add('4');
        winner = true;
      } else {
        if (board[1] == 'X') temp = 4;
      }
    }
    if (board[4] == board[7] && board[1] == '') {
      if (board[4] == 'O') {
        board[1] = 'O';
        ss.add('1');
        winner = true;
      } else {
        if (board[4] == 'X') temp = 1;
      }
    }
    if (board[2] == board[5] && board[8] == '') {
      if (board[2] == 'O') {
        board[8] = 'O';
        ss.add('8');
        winner = true;
      } else {
        if (board[2] == 'X') temp = 8;
      }
    }
    if (board[2] == board[8] && board[5] == '') {
      if (board[2] == 'O') {
        board[5] = 'O';
        ss.add('5');
        winner = true;
      } else {
        if (board[2] == 'X') temp = 5;
      }
    }
    if (board[5] == board[8] && board[2] == '') {
      if (board[5] == 'O') {
        board[2] = 'O';
        ss.add('2');
        winner = true;
      } else {
        if (board[5] == 'X') temp = 2;
      }
    }
  }

  checkRowForPlay(List<dynamic> board) {
    if (board[0] == board[1] && board[2] == '') {
      if (board[0] == 'O') {
        board[2] = 'O';
        ss.add('2');
        winner = true;
      } else {
        if (board[0] == 'X') temp = 2;
      }
    }
    if (board[0] == board[2] && board[1] == '') {
      if (board[0] == 'O') {
        board[1] = 'O';
        ss.add('1');
        winner = true;
      } else {
        if (board[0] == 'X') temp = 1;
      }
    }
    if (board[1] == board[2] && board[0] == '') {
      if (board[1] == 'O') {
        board[0] = 'O';
        ss.add('0');
        winner = true;
      } else {
        if (board[1] == 'X') temp = 0;
      }
    }
    if (board[4] == board[5] && board[3] == '') {
      if (board[4] == 'O') {
        board[3] = 'O';
        ss.add('3');
        winner = true;
      } else {
        if (board[4] == 'X') temp = 3;
      }
    }
    if (board[3] == board[5] && board[4] == '') {
      if (board[3] == 'O') {
        board[4] = 'O';
        ss.add('4');
        winner = true;
      } else {
        if (board[3] == 'X') temp = 4;
      }
    }
    if (board[4] == board[3] && board[5] == '') {
      if (board[4] == 'O') {
        board[5] = 'O';
        ss.add('5');
        winner = true;
      } else {
        if (board[4] == 'X') temp = 5;
      }
    }
    if (board[7] == board[6] && board[8] == '') {
      if (board[7] == 'O') {
        board[8] = 'O';
        ss.add('8');
        winner = true;
      } else {
        if (board[7] == 'X') {
          temp = 8;
        }
      }
    }
    if (board[7] == board[8] && board[6] == '') {
      if (board[7] == 'O') {
        board[6] = 'O';
        ss.add('6');
        winner = true;
      } else {
        if (board[7] == 'X') temp = 6;
      }
    }
    if (board[6] == board[8] && board[7] == '') {
      if (board[6] == 'O') {
        board[7] = 'O';
        ss.add('7');
        winner = true;
      } else {
        if (board[6] == 'X') temp = 7;
      }
    }
  }

  void checkDiagonalForPlay(List<dynamic> board) {
    if (board[0] == board[8] && board[4] == '') {
      if (board[0] == 'O') {
        board[4] = 'O';
        ss.add('4');
        winner = true;
      } else {
        if (board[0] == 'X') temp = 4;
      }
    }
    if (board[0] == board[4] && board[8] == '') {
      if (board[0] == 'O') {
        board[8] = 'O';
        ss.add('8');
        winner = true;
      } else {
        if (board[0] == 'X') temp = 8;
      }
    }
    if (board[8] == board[4] && board[0] == '') {
      if (board[8] == 'O') {
        board[0] = 'O';
        ss.add('0');
        winner = true;
      } else {
        if (board[8] == 'X') temp = 0;
      }
    }
    if (board[2] == board[4] && board[6] == '') {
      if (board[2] == 'O') {
        board[6] = 'O';
        ss.add('6');
        winner = true;
      } else {
        if (board[2] == 'X') temp = 6;
      }
    }
    if (board[6] == board[4] && board[2] == '') {
      if (board[6] == 'O') {
        board[2] = 'O';
        ss.add('2');
        winner = true;
      } else {
        if (board[6] == 'X') temp = 2;
      }
    }
    if (board[6] == board[2] && board[4] == '') {
      if (board[6] == 'O') {
        board[4] = 'O';
        ss.add('4');
      } else {
        if (board[6] == 'X') temp = 4;
      }
    }
  }
}

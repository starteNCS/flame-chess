import 'package:flutterwindows/events/board_change_event.dart';
import 'package:flutterwindows/events/tap_event.dart';
import 'package:flutterwindows/main.dart';
import 'package:flutterwindows/services/models/figure_tupel.dart';
import 'package:flutterwindows/util/enums/color.dart';
import 'package:flutterwindows/util/enums/figure.dart';

class BoardService {
  static const int boardXSize = 8;
  static const int boardYSize = 8;

  late final List<List<FigureTupel?>> _board;

  BoardService() {
    _initBoard();
    eventManager.listen((event) {
      if (event is TapEvent) {
        _board[1][1] = null;
        eventManager.publishEvent(BoardChangeEvent(board: _board));
      }
    });
  }

  void _initBoard() {
    _board = [
      _firstRow(FigureColor.white),
      _fillRow(FigureTupel(Figure.pawn, FigureColor.white)),
      _fillRow(null),
      _fillRow(null),
      _fillRow(null),
      _fillRow(null),
      _fillRow(FigureTupel(Figure.pawn, FigureColor.black)),
      _firstRow(FigureColor.black)
    ];
    eventManager.publishEvent(BoardChangeEvent(board: _board));
  }

  List<FigureTupel?> _firstRow(FigureColor color) {
    return [
      FigureTupel(Figure.rook, color),
      FigureTupel(Figure.knight, color),
      FigureTupel(Figure.bishop, color),
      FigureTupel(Figure.queen, color),
      FigureTupel(Figure.king, color),
      FigureTupel(Figure.bishop, color),
      FigureTupel(Figure.knight, color),
      FigureTupel(Figure.rook, color),
    ];
  }

  List<FigureTupel?> _fillRow(FigureTupel? tupel) {
    List<FigureTupel?> result = [];
    for (int x = 0; x < boardXSize; x++) {
      result.add(tupel);
    }
    return result;
  }
}

import 'package:flutterwindows/services/models/figure_tupel.dart';
import 'package:flutterwindows/util/enums/color.dart';
import 'package:flutterwindows/util/enums/figure.dart';

class BoardService {
  static const int boardXSize = 8;
  static const int boardYSize = 8;

  late final List<List<FigureTupel?>> board;

  BoardService() {
    board = [
      _firstRow(FigureColor.white),
      _fillRow(FigureTupel(Figure.pawn, FigureColor.white)),
      _fillRow(null),
      _fillRow(null),
      _fillRow(null),
      _fillRow(null),
      _fillRow(FigureTupel(Figure.pawn, FigureColor.black)),
      _firstRow(FigureColor.black)
    ];
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

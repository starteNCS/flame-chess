import 'dart:ui';

import 'package:flame/experimental.dart';
import 'package:flutterwindows/components/figure.dart';
import 'package:flutterwindows/util/enums/color.dart';
import 'package:flutterwindows/util/enums/figure.dart';

class BoardComponent extends World {
  static const int boardXSize = 8;
  static const int boardYSize = 8;

  static const double fieldSize = 200;

  final whitePaint = Paint()..color = const Color(0xffdddddd);
  final blackPaint = Paint()..color = const Color(0xff111111);

  @override
  Future<void> onLoad() async {
    _seedFigures(FigureColor.white);
  }

  @override
  void render(Canvas canvas) {
    for (int x = 0; x < boardXSize; x++) {
      for (int y = 0; y < boardYSize; y++) {
        canvas.drawRect(
            Rect.fromPoints(
              Offset(x * fieldSize, y * fieldSize),
              Offset((x + 1) * fieldSize, (y + 1) * fieldSize),
            ),
            (x + y) % 2 == 0 ? whitePaint : blackPaint);
      }
    }
  }

  void _seedFigures(FigureColor color) {
    addAll([
      FigureComponent(
          figureX: 0, figureY: 0, color: color, figure: Figure.rook),
      FigureComponent(
          figureX: 1, figureY: 0, color: color, figure: Figure.knight),
      FigureComponent(
          figureX: 2, figureY: 0, color: color, figure: Figure.bishop),
      FigureComponent(
          figureX: 3, figureY: 0, color: color, figure: Figure.queen),
      FigureComponent(
          figureX: 4, figureY: 0, color: color, figure: Figure.king),
      FigureComponent(
          figureX: 5, figureY: 0, color: color, figure: Figure.bishop),
      FigureComponent(
          figureX: 6, figureY: 0, color: color, figure: Figure.knight),
      FigureComponent(
          figureX: 7, figureY: 0, color: color, figure: Figure.rook),
    ]);

    _seedPawns(1, FigureColor.white);
  }

  void _seedPawns(int row, FigureColor color) {
    for (int x = 0; x < boardXSize; x++) {
      add(
        FigureComponent(
          figureX: x,
          figureY: row,
          color: color,
          figure: Figure.pawn,
        ),
      );
    }
  }
}

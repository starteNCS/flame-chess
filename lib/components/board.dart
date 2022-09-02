import 'dart:ui';

import 'package:flame/experimental.dart';
import 'package:flutterwindows/components/figure.dart';
import 'package:flutterwindows/events/board_change_event.dart';
import 'package:flutterwindows/main.dart';
import 'package:flutterwindows/services/models/figure_tupel.dart';

import '../services/board_service.dart';

class BoardComponent extends World {
  static const double fieldSize = 200;

  final whitePaint = Paint()..color = const Color(0xffdddddd);
  final blackPaint = Paint()..color = const Color(0xff111111);

  @override
  Future<void> onLoad() async {
    eventManager.listen((event) {
      if (event is BoardChangeEvent) {
        _fromBoardService(event.board);
      }
    });
  }

  @override
  void render(Canvas canvas) {
    for (int x = 0; x < BoardService.boardXSize; x++) {
      for (int y = 0; y < BoardService.boardYSize; y++) {
        canvas.drawRect(
            Rect.fromPoints(
              Offset(x * fieldSize, y * fieldSize),
              Offset((x + 1) * fieldSize, (y + 1) * fieldSize),
            ),
            (x + y) % 2 == 0 ? whitePaint : blackPaint);
      }
    }
  }

  void _fromBoardService(List<List<FigureTupel?>> figures) {
    for (int x = 0; x < figures.length; x++) {
      for (int y = 0; y < figures[x].length; y++) {
        final figure = figures[y][x];
        if (figure == null) {
          continue;
        }

        add(FigureComponent(
          figureX: x,
          figureY: y,
          color: figure.color,
          figure: figure.figure,
        ));
      }
    }
  }
}

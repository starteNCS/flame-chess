import 'dart:ui';

import 'package:flame/experimental.dart';

class BoardComponent extends World {
  static const int boardXSize = 8;
  static const int boardYSize = 8;

  static const double fieldSize = 200;

  final whitePaint = Paint()..color = const Color(0xffdddddd);
  final blackPaint = Paint()..color = const Color(0xff111111);

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
}

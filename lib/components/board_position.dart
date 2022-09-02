import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutterwindows/components/board.dart';

class BoardPositionComponent extends PositionComponent with TapCallbacks {
  final int figureX;
  final int figureY;
  final Vector2 figureSize =
      Vector2(BoardComponent.fieldSize, BoardComponent.fieldSize);
  late final Vector2 boardPosition;

  BoardPositionComponent({required this.figureX, required this.figureY}) {
    boardPosition = Vector2(figureX.toDouble(), figureY.toDouble());

    size = figureSize;
    position = Vector2(x, y);
  }

  Vector2 get pos => Vector2(x, y);

  @override
  double get x => figureX * figureSize.x;

  @override
  double get y => figureY * figureSize.x;
}

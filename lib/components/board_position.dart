import 'package:flame/components.dart';
import 'package:flutterwindows/components/board.dart';

class BoardPositionComponent extends PositionComponent {
  final int figureX;
  final int figureY;
  final Vector2 figureSize =
      Vector2(BoardComponent.fieldSize, BoardComponent.fieldSize);

  BoardPositionComponent({required this.figureX, required this.figureY});

  Vector2 get pos => Vector2(x, y);

  @override
  double get x => figureX * figureSize.x;

  @override
  double get y => figureY * figureSize.x;
}

import 'package:flame/components.dart';
import 'package:flutterwindows/util/enums/color.dart';
import 'package:flutterwindows/util/enums/figure.dart';

class MovementService {
  static List<Vector2> getPossibleDirections(
    Figure figure,
    FigureColor color,
    Vector2 currentPosition,
  ) {
    switch (figure) {
      case Figure.pawn:
        return _possiblePawnDirections(color, currentPosition);
      default:
        throw Exception('Not implemented yet');
    }
  }

  static List<Vector2> _possiblePawnDirections(
    FigureColor color,
    Vector2 currentPosition,
  ) {
    return [currentPosition..add(Vector2(0, color.movementDirection))];
  }
}

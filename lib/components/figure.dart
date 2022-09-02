import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutterwindows/components/board_position.dart';
import 'package:flutterwindows/util/enums/color.dart';
import 'package:flutterwindows/util/enums/figure.dart';

class FigureComponent extends BoardPositionComponent {
  final FigureColor color;
  final Figure figure;

  FigureComponent({
    required super.figureX,
    required super.figureY,
    required this.color,
    required this.figure,
  });

  @override
  void render(Canvas canvas) {
    final sprite = Sprite(Flame.images.fromCache(_getFigureImagePath()));
    sprite.render(canvas, size: figureSize, position: pos);
  }

  String _getFigureImagePath() {
    return 'figures/${color.pathName}/${figure.pathName}.png';
  }
}

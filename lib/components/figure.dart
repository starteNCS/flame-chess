import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flutterwindows/components/board_position.dart';
import 'package:flutterwindows/events/tap_event.dart';
import 'package:flutterwindows/main.dart';
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
  bool get debugMode => isDebugMode;

  @override
  void onTapUp(TapUpEvent event) {
    eventStream
        .add(TapEvent(color: color, figure: figure, position: boardPosition));
  }

  @override
  void render(Canvas canvas) {
    final sprite = Sprite(Flame.images.fromCache(_getFigureImagePath()));
    sprite.render(canvas, size: figureSize);

    super.render(canvas);
  }

  String _getFigureImagePath() {
    return 'figures/${color.pathName}/${figure.pathName}.png';
  }
}

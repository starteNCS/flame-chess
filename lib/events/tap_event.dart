import 'package:flame/components.dart';
import 'package:flutterwindows/events/event.dart';
import 'package:flutterwindows/util/enums/color.dart';
import 'package:flutterwindows/util/enums/figure.dart';

class TapEvent extends Event {
  final FigureColor color;
  final Figure figure;
  final Vector2 position;

  TapEvent({required this.color, required this.figure, required this.position})
      : super(message: '');

  @override
  String get value =>
      'Tapped ${color.pathName} ${figure.pathName} at (${position.x.toStringAsFixed(0)}, ${position.y.toStringAsFixed(0)})';
}

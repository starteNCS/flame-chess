import 'package:flutterwindows/events/event.dart';
import 'package:flutterwindows/util/enums/color.dart';
import 'package:flutterwindows/util/enums/figure.dart';

class TapEvent extends Event {
  final FigureColor color;
  final Figure figure;

  TapEvent({required this.color, required this.figure}) : super(message: '');

  @override
  String get value => 'Tapped ${color.pathName} ${figure.pathName}';
}

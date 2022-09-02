import 'package:flutterwindows/events/event.dart';
import 'package:flutterwindows/services/models/figure_tupel.dart';

class BoardChangeEvent extends Event {
  final List<List<FigureTupel?>> board;

  BoardChangeEvent({required this.board});

  @override
  String get debuggerValue => "Something changed on the board";
}

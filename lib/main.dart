import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutterwindows/components/board.dart';
import 'package:flutterwindows/components/figure.dart';
import 'package:flutterwindows/util/enums/color.dart';
import 'package:flutterwindows/util/enums/figure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final game = ChessGame();

  runApp(GameWidget(
    game: game,
  ));
}

class ChessGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await Flame.images.loadAll([
      'figures/black/pawn.png',
      'figures/black/rook.png',
      'figures/white/pawn.png',
      'figures/white/rook.png',
    ]);

    final pawn = FigureComponent(
      figureX: 0,
      figureY: 0,
      color: FigureColor.white,
      figure: Figure.rook,
    );

    final pawn2 = FigureComponent(
      figureX: 0,
      figureY: 1,
      color: FigureColor.white,
      figure: Figure.pawn,
    );

    final board = BoardComponent()
      ..add(pawn)
      ..add(pawn2);

    final camera = CameraComponent(world: board)
      ..viewfinder.visibleGameSize = Vector2(1600, 1600)
      ..viewfinder.position = Vector2(800, 0)
      ..viewfinder.anchor = Anchor.topCenter;

    add(board);
    add(camera);
  }
}

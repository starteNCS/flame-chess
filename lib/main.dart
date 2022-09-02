import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutterwindows/components/board.dart';

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
      'figures/black/knight.png',
      'figures/black/bishop.png',
      'figures/black/queen.png',
      'figures/black/king.png',
      'figures/white/pawn.png',
      'figures/white/rook.png',
      'figures/white/knight.png',
      'figures/white/bishop.png',
      'figures/white/queen.png',
      'figures/white/king.png',
    ]);

    final board = BoardComponent();

    final camera = CameraComponent(world: board)
      ..viewfinder.visibleGameSize = Vector2(1600, 1600)
      ..viewfinder.position = Vector2(800, 0)
      ..viewfinder.anchor = Anchor.topCenter;

    add(board);
    add(camera);
  }
}

import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutterwindows/components/board.dart';
import 'package:flutterwindows/components/debugger/debugger.dart';
import 'package:flutterwindows/services/board_service.dart';
import 'package:flutterwindows/services/event_manager.dart';

final EventManager eventManager = EventManager();
final BoardService boardService = BoardService();
const isDebugMode = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final game = ChessGame();
  boardService.hashCode;

  runApp(GameWidget(
    game: game,
  ));
}

class ChessGame extends FlameGame with HasTappableComponents {
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

    final debugger = DebuggerComponent()..position = Vector2(810, 10);
    final board = BoardComponent()..add(debugger);

    final camera = CameraComponent(world: board)
      ..viewfinder.visibleGameSize = Vector2(1600, 1600)
      ..viewfinder.position = Vector2(0, 0)
      ..viewfinder.anchor = Anchor.topLeft;

    add(board);
    add(camera);
  }
}

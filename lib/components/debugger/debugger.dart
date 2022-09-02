import 'dart:ui' hide TextStyle;

import 'package:flame/components.dart';
import 'package:flutter/painting.dart' hide Canvas;
import 'package:flutterwindows/events/event.dart';
import 'package:flutterwindows/events/message_event.dart';
import 'package:flutterwindows/main.dart';

class DebuggerComponent extends PositionComponent {
  final TextPaint _textPaint = TextPaint(style: const TextStyle(fontSize: 48));
  final List<Event> _events = [];

  @override
  Future<void> onLoad() async {
    eventManager.listen((event) {
      _events.add(event);
    });

    eventManager.publishEvent(MessageEvent(message: 'Debugger initialized'));
  }

  @override
  void render(Canvas canvas) {
    final messages = _events.map((e) => e.debuggerValue).join("\n");
    _textPaint.render(canvas, messages, position);
  }
}

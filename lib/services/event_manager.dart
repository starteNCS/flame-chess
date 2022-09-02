// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:collection';

import 'package:flutterwindows/events/event.dart';

class EventManager {
  static final _backQueue = Queue();
  static final _eventStream = StreamController<Event>.broadcast(
    onListen: () => print("✅ At least one listener subscribed"),
    onCancel: () =>
        print("❌ Stream cancelled. Will be opened with the next subscription"),
  );

  /// Publishes the [event] to the Stream for everybody to listen to.
  /// If there is no listener for the [event], the [event] gets added
  /// to a [Queue] and is then published as soon as the next event is added
  /// and the stream now has valid listeners
  void publishEvent(Event event) {
    if (!_eventStream.hasListener) {
      print(
          "🔈 Added Event to Queue: ${event.runtimeType}. Will be published as soon as there is a listener");
      _backQueue.add(event);
      return;
    }

    while (_backQueue.isNotEmpty) {
      final next = _backQueue.removeFirst();
      print("🔉 Published Event from Queue: ${next.runtimeType}");
      _eventStream.add(next);
    }

    print("🔊 Published Event: ${event.runtimeType}");
    _eventStream.add(event);
  }

  void listen(Function(Event) onData) {
    _eventStream.stream.listen(onData);
  }
}

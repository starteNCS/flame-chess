import 'package:flutterwindows/events/event.dart';

class MessageEvent extends Event {
  final String message;

  MessageEvent({required this.message});

  @override
  String get debuggerValue => message;
}

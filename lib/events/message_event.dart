import 'package:flutterwindows/events/event.dart';

class MessageEvent extends Event {
  MessageEvent({required super.message});

  @override
  String get value => message;
}

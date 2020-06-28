library post_office;

import 'package:flutter/material.dart';

///
/// PostOffice should be wrapped around a MaterialApp widget. It is repsonsible
/// for providing and distributing the Message through the widget tree.
///
class PostOffice extends StatefulWidget {
  final Widget child;

  const PostOffice({Key key, this.child}) : super(key: key);

  @override
  PostOfficeState createState() => PostOfficeState();

  static PostOfficeState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_InheritedPostOfficeState>()
      .data;
}

class PostOfficeState extends State<PostOffice> {
  Message message = Message();

  send(
    String newMessage, {
    MessageType type = MessageType.info,
    Duration duration = const Duration(seconds: 2),
  }) {
    setState(() => message = Message(text: newMessage, type: type));
    Future.delayed(duration, () => setState(() => message = Message()));
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedPostOfficeState(
      data: this,
      child: widget.child,
    );
  }
}

class Message {
  final String text;
  final MessageType type;

  Message({this.text = "", this.type = MessageType.info});
}

enum MessageType { info, success, error }

class _InheritedPostOfficeState extends InheritedWidget {
  final PostOfficeState data;

  _InheritedPostOfficeState({Key key, Widget child, this.data})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

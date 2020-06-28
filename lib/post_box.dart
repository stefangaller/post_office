import 'package:flutter/material.dart';
import 'package:post_office/post_office.dart';

class PostBox extends StatefulWidget {
  final Widget child;

  const PostBox({Key key, this.child}) : super(key: key);

  @override
  _PostBoxState createState() => _PostBoxState();
}

class _PostBoxState extends State<PostBox> {
  @override
  Widget build(BuildContext context) {
    final message = PostOffice.of(context).message;
    return Stack(
      children: <Widget>[
        widget.child,
        Material(
          color: _colorForType(message.type),
          elevation: 4,
          child: Container(
            constraints: BoxConstraints(
                minWidth: double.infinity,
                maxHeight: message.text.isEmpty ? 0 : double.infinity),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                message.text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _colorForType(MessageType type) {
    switch (type) {
      case MessageType.info:
        return Colors.lightBlue;
      case MessageType.error:
        return Colors.deepOrange;
      case MessageType.success:
        return Colors.green;
    }
    return Colors.transparent;
  }
}

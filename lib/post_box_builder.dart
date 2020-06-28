import 'package:flutter/material.dart';
import 'package:post_office/post_office.dart';

typedef Widget BuildFunction(BuildContext context, Message message);

class PostBoxBuilder extends StatelessWidget {
  final BuildFunction builder;

  const PostBoxBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = PostOffice.of(context).message;
    return builder(context, message);
  }
}

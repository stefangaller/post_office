
import 'package:flutter/material.dart';
import 'package:post_office/post_box.dart';
import 'package:post_office/post_office.dart';

void main() {
  runApp(PostOfficeApp());
}

class PostOfficeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PostOffice(
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: PostBox(
        child: Center(
          child: RaisedButton(
            child: Text("Start registration"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: PostBox(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text("Invalid Registration"),
                onPressed: () => PostOffice.of(context)
                    .send("Invalid Registration", type: MessageType.error),
              ),
              RaisedButton(
                child: Text("Valid Registration"),
                onPressed: () {
                  Navigator.pop(context);
                  PostOffice.of(context)
                      .send("Valid Registration", type: MessageType.success);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

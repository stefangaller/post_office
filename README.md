# PostOffice

## Overview
Using a Snackbar requires you to have access to the BuildContext of the current Scaffold.
PostOffice allows you to trigger info messages in your app and display them everywhere a PostBox is installed.

## Installation
```yaml
dependencies:
  post_office: ^0.0.1
```

## Usage
Simply wrap your `MaterialApp` in the `PostOffice` widget. 
The `PostOffice` will distribute your messages throughout your app.
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PostOffice(
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
```

Wrap your Scaffold's body content in a `PostBox` widget to receive and display all messages sent to PostOffice.
```dart
Scaffold(
  body: PostBox(
    child: //Put your body here
  )
);
```

Anywhere in your app you can send messages to the `PostOffice`. 
Additionally, you can specify a type and a duration, how long the message should be displayed.
```dart
PostOffice.of(context).send(
  "registration complete",
  type: MessageType.success,
  duration: Duration(seconds: 3),
);
```

If you want complete freedom of how your Message should look like, you can also use PostBoxBuilder
and render your own Widget.
```dart
PostBoxBuilder(
  builder: (context, message){
    return Text(message.text);
  },
),
```
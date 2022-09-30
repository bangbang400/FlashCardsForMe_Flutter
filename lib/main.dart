import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterHajimeniKakuYatu',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FlashCardsForMe'),
        ),
        body: Center(
          child: Container(
            color: Colors.grey,
            height: 300.0,
            width: 300.0,
          ),
        )
      ),
    );
  }
}
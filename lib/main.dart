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
          body: Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    color: Colors.grey,
                    height: 300.0,
                    width: 300.0,
                  ),
                  Padding(padding: EdgeInsets.all(5),),
                  Container(
                    color: Colors.black,
                    height: 80.0,
                    width: 300.0,
                  ),
                  Padding(padding: EdgeInsets.all(5),),
                  Container(
                    color: Colors.black,
                    height: 80.0,
                    width: 300.0,
                  ),
                  Padding(padding: EdgeInsets.all(5),),
                  Container(
                    color: Colors.black,
                    height: 80.0,
                    width: 300.0,
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
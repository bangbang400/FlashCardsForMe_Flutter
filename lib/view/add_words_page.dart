import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class AddWordsPage extends StatelessWidget {
  const AddWordsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('単語を追加'),
      ),
      body: Container(
      ),
    );
  }
}

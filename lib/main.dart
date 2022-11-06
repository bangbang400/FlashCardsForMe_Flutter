import 'package:flash_cards_for_me/db/db_helper.dart';
import 'package:flash_cards_for_me/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 一旦DBをリセットする
    // resetDB();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlashCardsForMe',
      home: HomePage(),
    );
  }

  // DBをリセットする
  void resetDB() async {
    await DbHelper.instance.resetDatabase();
  }
}
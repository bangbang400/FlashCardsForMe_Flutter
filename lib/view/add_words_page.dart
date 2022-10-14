import 'package:flash_cards_for_me/db/db_helper.dart';
import 'package:flash_cards_for_me/db/words.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class AddWordsPage extends StatefulWidget {
  final Words? words;
  const AddWordsPage({Key? key, this.words}) : super(key: key);
  @override
  _AddWordsPageState createState() => _AddWordsPageState();
}

class _AddWordsPageState extends State<AddWordsPage> {
  late int id;
  late String word;
  late String commentary;
  late DateTime createdAt;
  late DateTime modifiedAt;

  @override
  void initState() {
    super.initState();
    id = widget.words?.id ?? 0;
    word = widget.words?.word ?? '';
    commentary = widget.words?.commentary ?? '';
    createdAt = widget.words?.createdAt ?? DateTime.now();
    modifiedAt = widget.words?.modifiedAt ?? DateTime.now();
  }

  // 単語追加ウィジェット
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('単語を追加'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: (){
            // DB追加処理を実行
            addWord;
          },
          child: Text(
            'DB追加',
            style: TextStyle(
                fontSize: 10
            ),
          ),
          style: ButtonStyle(),
        ),
      ),
    );
  }

  // DBに１件のデータを登録する
  void addWord() async {
    await addWordProcess();
  }

  Future addWordProcess() async{
    final wordData = Words(
        word: word,
        commentary: commentary,
        correct: null,
        wrong: null,
        createdAt: createdAt,
        modifiedAt: modifiedAt,
    );
    await DbHelper.instance.insert(wordData);
  }
}

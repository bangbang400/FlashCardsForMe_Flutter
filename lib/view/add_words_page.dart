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
        child: Column(
          children: [
            // 単語入力フォーム
            Padding(padding: EdgeInsets.all(20),),
            Container(
              // margin: EdgeInsets.all(20),
              // padding: EdgeInsets.all(20),
              width: double.infinity,
              color: Colors.grey,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '半角30文字、全角60文字以内',
                ),
                autofocus: true, // オートフォーカス
              ),
            ),
            Padding(padding: EdgeInsets.all(5),),
            // 単語の解説入力フォーム
            Container(
              // margin: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.grey,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '半角30文字、全角60文字以内',
                ),
                autofocus: true, // オートフォーカス
              ),
            ),
            Padding(padding: EdgeInsets.all(5),),
            ElevatedButton(
              onPressed: (){
                // DB追加処理を実行
                addWord;
                },
              child: Text(
                'DB追加',
                style: TextStyle(fontSize: 10),
              ),
              style:
            ),
          ],
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

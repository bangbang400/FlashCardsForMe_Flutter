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

  double screenHeight = 0; // 画面の高さ
  double screenWidth = 0; // 画面の横幅

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
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('単語を追加'),
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 単語入力フォーム
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Container(
              margin: EdgeInsets.all(10),
              // padding: EdgeInsets.all(20),
              // width: double.infinity,
              // color: Colors.yellow,
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: '単語：10文字以内',
                  ),
                  autofocus: true, // オートフォーカス
                  onChanged: (word) => setState(() => this.word = word),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(5),
            // ),
            // 単語の解説入力フォーム
            Container(
              margin: EdgeInsets.all(10),
              // color: Colors.yellow,
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  maxLength: 60,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    hintText: '解説：60文字以内',
                  ),
                  autofocus: true, // オートフォーカス
                  onChanged: (commentary) =>
                      setState(() => this.commentary = commentary),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(5),
            // ),
            ElevatedButton(
              onPressed: () {
                // DB追加処理を実行
                addWord();
              },
              child: Text(
                '単語追加',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                fixedSize: Size(screenWidth * 0.7, 50)
              ),
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

  Future addWordProcess() async {
    final wordData = Words(
      word: word,
      commentary: commentary,
      correct: 0,
      wrong: 0,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
    );
    await DbHelper.instance.insert(wordData);
  }
}

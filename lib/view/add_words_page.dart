import 'package:flash_cards_for_me/db/db_helper.dart';
import 'package:flash_cards_for_me/db/words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  bool result = false;

  var wordController = TextEditingController();
  var commentaryController = TextEditingController();

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
                // 単語のフィールドを100字以内に拡張する
                child: TextField(
                  controller: wordController,
                  maxLength: 100,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: '単語：100文字以内',
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
            // 
            Container(
              margin: EdgeInsets.all(10),
              // color: Colors.yellow,
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: commentaryController,
                  maxLength: 200,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: '解説：200文字以内',
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
                if(word != '' && commentary != ''){
                  // 単語と解説どちらもNullでなければ登録処理を実行する
                  addWord();
                }else{
                  showAlertValidationError();
                }
              },
              child: Text(
                '単語登録',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fixedSize: Size(screenWidth * 0.7, 50)),
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

  // 単語を登録したときにステータスを表示するアラート
  void showAlert() async {
    String message = '';
    result ? message = '単語を１件登録しました。' : message = '単語の登録に失敗しました。';

    if(result){
      wordController.clear();
      commentaryController.clear();
    }

    // Android用ダイアログ
    // showDialog(
    //   context: context,
    //   builder: (_) {
    //     return AlertDialog(
    //       title: Text('単語登録'),
    //       content: Text(message),
    //       actions: <Widget>[
    //         FloatingActionButton(
    //           child: Text('OK'),
    //           onPressed: () => Navigator.pop(context),
    //         )
    //       ],
    //     );
    //   },
    // );

    // iOSっぽいダイアログ
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('単語登録'),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                  child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        },
    );
  }

  // 単語を登録したときにステータスを表示するアラート
  void showAlertValidationError() async {
    String message = '単語と解説を入力してください。';
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('入力エラー'),
          content: Text(message),
          actions: <Widget>[
            FloatingActionButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
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
    result = await DbHelper.instance.insert(wordData);
    showAlert(); // アラートを表示する
  }
}

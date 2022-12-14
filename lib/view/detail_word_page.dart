import 'package:flash_cards_for_me/db/db_helper.dart';
import 'package:flutter/material.dart';
import '../db/words.dart';

class DetailWordPage extends StatefulWidget {
  final int id;
  const DetailWordPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailWordPageState createState() => _DetailWordPageState();
}

class _DetailWordPageState extends State<DetailWordPage> {
  // detailはウィジェットの置き方を修正する
  // late :
  // lateで宣言された変数が使用されないときは初期化されない
  // 変数宣言時のthisへのアクセス
  // Null safety有効化時のUnitTestでNon-nullable
  late Words words;
  bool isLoading = false; // DBの値を読み込む時のステータス
  double screenHeight = 0; // 画面の高さ
  double screenWidth = 0; // 画面の横幅
  bool commentaryVisible = false; // 解説の表示非表示切り替え
  double answerButtonHeight = 60; // 回答ボタンの高さ

  @override
  void initState() {
    super.initState();
    wordsData();
  }

  // Future:
  // 非同期処理の返り値を表すクラス
  // リストのidに紐づいた１件のデータを取得する
  Future wordsData() async {
    setState(() => isLoading = true);
    words = await DbHelper.instance.wordData(widget.id);
    setState(() => isLoading = false);
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // title: Text('単語詳細'),
      ),
      // Row:横方向
      // Column:縦方向
      // mainAxisAlignment:縦方向
      // crossAxisAlignment:横方向
      body: Column(
        children: [
          Container(
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              // padding: const EdgeInsets.all(15.0),//内部に余白ができる
              margin: EdgeInsets.all(20.0),
              child: Row(
                // mainAxisAlignment:Rowの場合、横方向の中央
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Flexible ・・・文字列の折り返しができる
                  Flexible(
                    child: Column(
                      children: [
                        // 単語
                        isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                width: screenWidth,
                                height: screenHeight * 0.15,
                                // color: Colors.black12,// debug用カラー
                                child: Text(
                                  words.word ?? '読み込みエラー',
                                  // style: TextStyle(fontSize: 40),
                                  style: TextStyle(fontSize: 40),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                        // 解説
                        isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                width: screenWidth,
                                height: screenHeight * 0.4,
                                // color: Colors.black26,// debug用カラー
                                child: Text(
                                  (commentaryVisible)?words.commentary ?? '読み込みエラー':"",
                                  // style: TextStyle(fontSize: 20),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // color: Colors.black26, // debug用カラー
            alignment: Alignment(0.8, 0),
            child: ElevatedButton(
              onPressed: () {
                // ボタンを押下すると解説を表示させる
                // 同時に解説ボタンも非表示にする
                // Visibility(
                //   visible: commentaryVisible,
                //   child:
                // );
                commentaryVisible = true;
                // setState(() {}); 画面を再描画したいとき
                setState(() {

                });
              },
              child: Text(
                '解説',
                style: TextStyle(fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(60, 60),
                shape: CircleBorder(
                    // side: BorderSide(
                    //   width: 1,
                    //   // style: BorderStyle.solid,
                    // ),
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            children:[
            ElevatedButton(
              onPressed: () {

              },
              child: Text('知らない'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(screenWidth / 2, answerButtonHeight),
              ),
            ),
              ElevatedButton(
                onPressed: () {
                },
                child: Text('知ってる'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(screenWidth / 2, answerButtonHeight),
                ),
              ),
            ]
          )
        ],
      ),
    );
  }
}

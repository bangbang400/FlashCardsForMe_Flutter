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
  bool isLoading = false;
  double screenHeight = 0; // 画面の高さ
  double screenWidth = 0; // 画面の横幅

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
          title: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Text(words.word ?? '単語詳細'),
        ),
        // Row:横方向
        // Column:縦方向
        // mainAxisAlignment:縦方向
        // crossAxisAlignment:横方向
        // body: Container(
        body: Container(
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            // padding: const EdgeInsets.all(15.0),//内部に余白ができる
            margin: EdgeInsets.all(20.0),
            // alignment: Alignment.topCenter,
            // alignment: const Alignment(5, 5),
            // height: screenHeight/2,
            // width: screenWidth,
            // color: Colors.red,
            child: Row(
              // mainAxisAlignment:Rowの場合、横方向の中央
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      // 単語
                      isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              alignment: Alignment.center,
                              color: Colors.red,
                              child: Text(
                                words.word ?? '読み込みエラー',
                                // style: TextStyle(fontSize: 40),
                                style: TextStyle(fontSize: 40),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      // 単語の説明
                      isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              alignment: Alignment.center,
                              color: Colors.lightGreenAccent,
                              child: Text(
                                words.commentary ?? '読み込みエラー',
                                // style: TextStyle(fontSize: 20),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                      Container(
                        alignment: Alignment(0.5, 0.8),
                        child: ElevatedButton(
                          onPressed: () {
                            // ボタンを押下すると解説を表示させる
                            // 同時に解説ボタンも非表示にする
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

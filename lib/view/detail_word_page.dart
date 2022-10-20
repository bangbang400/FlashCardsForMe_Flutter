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
  // late :
  // lateで宣言された変数が使用されないときは初期化されない
  // 変数宣言時のthisへのアクセス
  // Null safety有効化時のUnitTestでNon-nullable
  late Words words;
  bool isLoading = false;

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
        body: Container(
          // padding: const EdgeInsets.all(15.0),//内部に余白ができる
          margin: EdgeInsets.all(10.0),
          // alignment: Alignment.topCenter,
          // alignment: const Alignment(5, 5),
          child: Row(
            // mainAxisAlignment:Rowの場合、横方向の中央
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  // 単語
                  isLoading ? const Center(
                    child: CircularProgressIndicator(),
                  ) :
                  Text(
                    words.word ?? '読み込みエラー',
                    style: TextStyle(fontSize: 40),
                  ),
                  // 単語の説明
                  isLoading ? const Center(
                    child: CircularProgressIndicator(),
                  ) :
                  Text(
                    words.commentary ?? '読み込みエラー',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),

            ],
          ),
        ));
  }
}

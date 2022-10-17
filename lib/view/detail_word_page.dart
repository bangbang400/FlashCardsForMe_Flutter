import 'package:flutter/material.dart';
import '../db/words.dart';


class DetailWordPage extends StatefulWidget {
  final Words? words;
  const DetailWordPage({Key? key, this.words}) : super(key: key);

  @override
  _DetailWordPageState createState() => _DetailWordPageState();
}

class _DetailWordPageState extends State<DetailWordPage> {

  // late :
  // lateで宣言された変数が使用されないときは初期化されない
  // 変数宣言時のthisへのアクセス
  // Null safety有効化時のUnitTestでNon-nullable
  late int id;
  late String word;
  late String commentary;
  late DateTime createdAt;
  late DateTime modifiedAt;

  @override
  void initState() {
    super.initState();
    // wordsData();
  }

  // Future:
  // 非同期処理の返り値を表すクラス
  // Future wordsData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ここに単語名'),
      ),
      body: Container(

      ),
    );
  }
}

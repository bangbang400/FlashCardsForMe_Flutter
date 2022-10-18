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
    print(widget.id);
  }

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

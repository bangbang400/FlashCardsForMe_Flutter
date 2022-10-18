import 'package:flash_cards_for_me/db/db_helper.dart';
import 'package:flash_cards_for_me/view/detail_word_page.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards_for_me/db/words.dart';

class ListWordsPage extends StatefulWidget {
  const ListWordsPage({Key? key}) : super(key: key);

  @override
  _ListWordsPageState createState() => _ListWordsPageState();
}

class _ListWordsPageState extends State<ListWordsPage> {
  List<Words> wordsList = []; // 全データ
  bool isLoading = false; // save table state

  // state(状態) initState()はウィジェットツリーの初期化
  @override
  void initState() {
    super.initState();
    getWordsList();
  }

  Future getWordsList() async {
    setState(() => isLoading = true); // now loading
    wordsList = await DbHelper.instance.getAllWords();
    setState(() => isLoading = false); // loading completed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('単語リスト'),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                child: ListView.builder(
                  itemCount: wordsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final word = wordsList[index];
                    return Card(
                      child: InkWell(
                        onTap: () async {
                          // リストをタップした時の挙動
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailWordPage(id: word.id!),
                            ),
                          );
                        },
                        // Inkwellとはウィジェットに対してsplash(タッチエフェクト)を表示したいとき
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                word.word,
                                style: const TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}

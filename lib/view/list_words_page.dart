import 'package:flash_cards_for_me/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards_for_me/db/words.dart';

class ListWordsPage extends StatefulWidget {
  const ListWordsPage({Key? key}) : super(key: key);

  @override
  _ListWordsPageState createState() => _ListWordsPageState();
}

class _ListWordsPageState extends State<ListWordsPage> {

  List<Words> wordsList = []; // all data
  bool isLoading = false; // save table state

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
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : SizedBox(
        child: ListView.builder(
          itemCount: wordsList.length,
          itemBuilder: (BuildContext context, int index) {
            final word = wordsList[index];
            return Card(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Text(word.word,
                      style: const TextStyle(fontSize: 30),)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}

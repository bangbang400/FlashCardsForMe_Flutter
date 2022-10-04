import 'package:flash_cards_for_me/view/add_words_page.dart';
import 'package:flash_cards_for_me/view/lesson_words_page.dart';
import 'package:flash_cards_for_me/view/list_words_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(50),),
              Container(
                child: Text(
                  'Flash Cards for me',
                  style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // color: Colors.grey,
                height: 300.0,
                width: 300.0,
              ),
              Padding(padding: EdgeInsets.all(10),),
              Container(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddWordsPage()),
                      );
                    },
                    child: Text(
                      '単語を追加',
                      style: TextStyle(
                        // color: Colors.black87,
                        fontSize: 20,
                      ),),
                    style: ButtonStyle(),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),),
              Container(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListWordsPage()),
                      );
                    },
                    child: Text(
                      '単語リスト',
                      style: TextStyle(
                        // color: Colors.black87,
                        fontSize: 20,
                      ),),
                    style: ButtonStyle(),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),),
              Container(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LessonWordsPage()),
                      );
                    },
                    child: Text(
                      'レッスン',
                      style: TextStyle(
                        // color: Colors.black87,
                        fontSize: 20,
                      ),),
                    style: ButtonStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
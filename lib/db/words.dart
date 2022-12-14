import 'package:flash_cards_for_me/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Words{
  int? id; // id
  String word; // 単語
  String commentary; // 解説
  int? correct; // 正答数
  int? wrong; // 誤答数
  DateTime createdAt; // データ作成日
  DateTime modifiedAt; // データ更新日

  Words({
    this.id,
    required this.word,
    required this.commentary,
    required this.correct,
    required this.wrong,
    required this.createdAt,
    required this.modifiedAt,
  });

  static Words fromJson(Map<String, Object?> json) => Words(
    id: json[columnId] as int,
    word: json[columnWord] as String,
    commentary: json[columnCommentary]as String,
    correct: json[columnCorrect]as int,
    wrong: json[columnWrong]as int,
    createdAt: DateTime.parse(json[columnCreatedAt]as String),
    modifiedAt: DateTime.parse(json[columnModifiedAt]as String),
  );

  Map<String, Object> toJson() => {
    columnWord: word,
    columnCommentary: commentary,
    columnCorrect:correct as int,
    columnWrong:wrong as int,
    columnCreatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(createdAt),
    columnModifiedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(modifiedAt),
  };
}

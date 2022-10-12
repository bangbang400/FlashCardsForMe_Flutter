import 'package:flash_cards_for_me/db/db_helper.dart';
import 'package:flutter/material.dart';

class Words{
  int? id;
  String word;
  String commentary;
  int? correct;
  int? wrong;
  int? createdAt;
  int? modifiedAt;

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
    createdAt: json[columnCreatedAt]as int,
    modifiedAt: json[columnModifiedAt]as int,
  );

  Map<String, Object> toJson() => {
    columnWord: word,
    columnCommentary: commentary,
  };
}

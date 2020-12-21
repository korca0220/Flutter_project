import 'package:flutter/material.dart';

class Memo {
  final String id;
  final String title;
  final String text;
  final String create_time;
  final String edit_time;

  Memo({
    this.id,
    this.title,
    this.text,
    this.create_time,
    this.edit_time
  });

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'title' : title,
      'text' : text,
      'create_time': create_time,
      'edit_time': edit_time
    };
  }

  @override
  String toString(){
    return 'Memo(id: $id, title: $title, text: $text, create_time: $create_time, edit_time:$edit_time)';
  }
}
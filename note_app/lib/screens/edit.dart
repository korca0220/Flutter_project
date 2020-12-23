import 'package:flutter/material.dart';
import 'package:note_app/database/db.dart';
import 'package:note_app/database/memo.dart';

import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method


class EditPage extends StatelessWidget {
  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
          IconButton(icon: const Icon(Icons.save),
              onPressed: saveDB)
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                  onChanged: (String title) {
                    this.title = title;
                  },
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: '제목을 적어주세요'
                  )
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                  onChanged: (String text) {
                    this.text = text;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 12,
                  decoration: InputDecoration(
                      hintText: '메모의 내용을 적어주세요'
                  )
              )
            ],
          )
      ));
  }
  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
        id: Str2Sha256(DateTime.now().toString()),
        title: this.title,
        text: this.text,
        create_time: DateTime.now().toString(),
        edit_time: DateTime.now().toString()
    );

    await sd.insertMemo(fido);

    // Log 확인용
    print(await sd.memos());
  }

  String Str2Sha256(String text){
    var bytes = utf8.encode(text);
    var digest = sha512.convert(bytes);

    return digest.toString();
  }
}

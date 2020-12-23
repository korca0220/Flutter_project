import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:note_app/database/db.dart';
import 'package:note_app/database/memo.dart';

class ViewPage extends StatefulWidget {
  ViewPage({Key key, this.id}) : super(key: key);

  final String id;

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
            IconButton(icon: const Icon(Icons.edit), onPressed: () {})
          ],
        ),
        body: Padding(padding: EdgeInsets.all(20), child: LoadBuilder()));
  }

  Future<List<Memo>> findMemo(String id) async {
    DBHelper sd = DBHelper();
    return await sd.findMemo(id);
  }

  LoadBuilder() {
    return FutureBuilder<List<Memo>>(
        future: findMemo(id),
        builder: (BuildContext context, AsyncSnapshot<List<Memo>> snapshot) {
          if (snapshot?.data?.isEmpty ?? true) {
            return Container(child: Text("데이터를 불러올 수 없습니다."));
          } else {
            Memo memo = snapshot.data[0];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: 70,
                    child: SingleChildScrollView(
                      child: Text(memo.title,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500)),
                    )),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  "메모 만든 시간 : ${memo.create_time.split(".")[0]}",
                  style: TextStyle(fontSize: 11),
                  textAlign: TextAlign.end,
                ),
                Text("메모 수정 시간 : ${memo.edit_time.split(".")[0]}",
                    style: TextStyle(fontSize: 11), textAlign: TextAlign.end),
                Padding(padding: EdgeInsets.all(10)),
                Expanded(child: SingleChildScrollView(
                    child : Text(memo.text)
                ))
              ],
            );
          }
        });
  }
}

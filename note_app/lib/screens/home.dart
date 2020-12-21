import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit.dart';

import 'package:note_app/database/memo.dart';
import 'package:note_app/database/db.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:20, top: 20, bottom: 20),
            child: Text(
              '메모메모',
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.blue
              ),
            ),
          ),
          Expanded(child: memoBuilder())
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => EditPage())
          );
        },
        tooltip: '메모를 추가하려면 클릭하세요',
        label: Text('메모 추가'),
        icon: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  List<Widget> LoadMemo() {
    List<Widget> memoList = [];
    memoList.add(Container(color: Colors.redAccent, height: 120,));
    memoList.add(Container(color: Colors.orange, height: 120,));
    return memoList;
  }

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    var fido = await sd.memos();
    return fido;
  }

  Widget memoBuilder() {
    return FutureBuilder(
        builder: (context, snap) {
          if (snap.data.isEmpty) {
            return Container(
              child: Text(
                "메모를 지금 바로 추가해보세요!"
              ),
            );
          }
          return ListView.builder(
              itemCount: snap.data.length,
              itemBuilder: (context, index) {
                Memo memo = snap.data[index];
                return Column(
                  children: <Widget>[
                    Text(memo.title),
                    Text(memo.text),
                    Text(memo.edit_time)
                  ],
                );
              }
          );
        },
        future: loadMemo(),
    );
  }
}



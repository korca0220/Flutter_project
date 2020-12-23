import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:note_app/screens/edit.dart';
import 'package:note_app/screens/view.dart';

import 'package:note_app/database/memo.dart';
import 'package:note_app/database/db.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String deleteId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20, top: 40, bottom: 20),
              child: Container(
                child: Text('메모메모',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                alignment: Alignment.centerLeft,
              )),
          Expanded(child: memoBuilder(context))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => EditPage()));
        },
        tooltip: '메모를 추가하려면 클릭하세요',
        label: Text('메모 추가'),
        icon: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }

  Future<List<Memo>> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
    await sd.deleteMemo(id);
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title : Text("삭제 경고"),
            content: Text("정말 삭제하시겠습니까?"),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.pop(context, "삭제");
                    setState(() {
                      deleteMemo(deleteId);
                    });
                    deleteId = "";
                  },
                  child: Text("삭제")
              ),
              FlatButton(
                  onPressed: (){
                    deleteId = "";
                    Navigator.pop(context, "취소");
                  },
                  child: Text("취소")
              ),
            ],
          );
        }
    );
  }

  Widget memoBuilder(BuildContext parent_context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap?.data?.isEmpty ?? true) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              "지금 바로 '메모 추가' 버튼을 눌러\n 새로운 메모를 추가해보세요!!\n\n\n\n\n\n\n",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: snap.data.length,
            itemBuilder: (context, index) {
              Memo memo = snap.data[index];
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      parent_context,
                      CupertinoPageRoute(
                          builder: (context) => ViewPage(id: memo.id))
                    );
                  },
                  onLongPress: () {
                    setState(() {
                      deleteId = memo.id;
                      showAlertDialog(parent_context);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(memo.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        Text(
                          memo.text,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "최종 수정 시간 : " + memo.edit_time.split('.')[0],
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.end,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ));
            });
      },
      future: loadMemo(),
    );
  }
}

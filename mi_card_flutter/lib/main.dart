import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
          // 위아래로 정렬 ( ex) 전체를 꽉차게하고 가운데 사이에 정렬)
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

          // 어느 자식 기준으로 방향 정렬할지 ( ex) 가장 긴 자식의 끝부분에 정렬)
          crossAxisAlignment: CrossAxisAlignment.stretch,

          // 시작 하는 부분 설정
          // verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Container(
              width: 30,
              color: Colors.white,
              child: Text('Container 1'),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              color: Colors.blue,
              child: Text('Container 2'),
            ),
            Container(
              color: Colors.red,
              child: Text('Container 3'),
            ),
          ],
        )),
      ),
    );
  }
}

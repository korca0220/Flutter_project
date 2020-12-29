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
            child: Column(
          // 위아래로 정렬 ( ex) 전체를 꽉차게하고 가운데 사이에 정렬)
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

          // 어느 자식 기준으로 방향 정렬할지 ( ex) 가장 긴 자식의 끝부분에 정렬)
          crossAxisAlignment: CrossAxisAlignment.stretch,

          // 시작 하는 부분 설정
          // verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              color: Colors.white,
              child: Text('Container 1'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: Text('Container 2'),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Text('Container 3'),
            ),
            Container(
              // 오른쪽 기준으로 맞추기 위한 임의의 컨테이너
              width: double.infinity,
            )
          ],
        )),
      ),
    );
  }
}

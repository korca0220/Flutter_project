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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // 시작 하는 부분 설정
          // verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Container(
              width: 100,
              color: Colors.red,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
              Container(
                width: 100,
                height: 100,
                color: Color.fromARGB(100, 255, 255, 0),
              ),
            ]),
            Container(
              color: Colors.blue,
              width: 100,
            ),
          ],
        )),
      ),
    );
  }
}

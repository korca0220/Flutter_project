import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ViewPage extends StatelessWidget {
  ViewPage({Key key, this.id}) : super(key:key);

  final String id;
  //TODO : findMemo 추가    

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(id),
    );
  }
}

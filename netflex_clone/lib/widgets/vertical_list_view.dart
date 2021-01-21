import 'package:flutter/material.dart';
import 'package:netflex_clone/widgets/list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({
    Key key,
    @required this.resultList,
  }) : super(key: key);

  final List<DocumentSnapshot> resultList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: resultList.length,
        padding: EdgeInsets.all(3),
        itemBuilder: (context, index) {
          return RowListItem(
            docs: resultList[index],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 2.0,
          );
        },
      ),
    );
  }
}

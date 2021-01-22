import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflex_clone/widgets/list_item.dart';

class LikeScreen extends StatefulWidget {
  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('movies')
            .where('like', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return _buildList(context, snapshot.data.docs);
        });
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<DocumentSnapshot> likedResults = [];
    for (DocumentSnapshot d in snapshot) {
      if (d.data()['like']) likedResults.add(d);
    }
    return Expanded(
      child: ListView.separated(
        itemCount: likedResults.length,
        padding: EdgeInsets.all(3),
        itemBuilder: (context, index) {
          return RowListItem(
            docs: likedResults[index],
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Image.asset(
                  'images/bbongflix_logo.png',
                  height: 30,
                ),
                SizedBox(width: 20),
                Text(
                  '내가 찜한 콘텐츠',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          _buildBody(context)
        ],
      ),
    );
  }
}

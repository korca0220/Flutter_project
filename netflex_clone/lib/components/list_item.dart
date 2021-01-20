import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflex_clone/screens/detail_screen.dart';
import 'package:netflex_clone/models/model_movie.dart';

class RowListItem extends StatelessWidget {
  final DocumentSnapshot docs;
  RowListItem({this.docs});

  @override
  Widget build(BuildContext context) {
    final movie = Movie.fromSnapshot(docs);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(movie: movie);
        }));
      },
      child: Container(
        height: 80,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          docs.data()['poster'],
                        ),
                        fit: BoxFit.cover)),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                height: double.maxFinite,
                color: Colors.black12,
                child: Row(
                  children: [
                    Text(
                      docs.data()['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}

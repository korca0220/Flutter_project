import 'package:flutter/material.dart';
import 'package:netflex_clone/models/model_movie.dart';
import 'package:netflex_clone/screens/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;
  CircleSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('미리보기'),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: makeCircleImages(context, movies),
          ),
        )
      ]),
    );
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (int i = 0; i < movies.length; i++) {
    results.add(InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(movie: movies[i]);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(movies[i].poster),
          ),
        ),
      ),
    ));
  }
  return results;
}

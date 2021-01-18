import 'package:flutter/material.dart';
import 'package:netflex_clone/models/model_movie.dart';

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
            children: makeCircleImages(movies),
          ),
        )
      ]),
    );
  }
}

List<Widget> makeCircleImages(List<Movie> moveis) {
  List<Widget> results = [];
  for (int i = 0; i < moveis.length; i++) {
    results.add(InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage('images/' + moveis[i].poster),
          ),
        ),
      ),
    ));
  }
  return results;
}

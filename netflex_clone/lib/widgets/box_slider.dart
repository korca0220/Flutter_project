import 'package:flutter/material.dart';
import 'package:netflex_clone/models/model_movie.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  BoxSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('지금 뜨는 컨텐츠'),
          Container(
            height: 140,
            child: ListView(
              children: makeBoxImages(movies),
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(List<Movie> movies) {
  List<Widget> results = [];
  for (int i = 0; i < movies.length; i++) {
    results.add(Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset('images/' + movies[i].poster),
          ),
        ),
      ),
    ));
  }
  return results;
}

import 'package:flutter/material.dart';

import 'package:netflex_clone/widgets/top_bar.dart';
import 'package:netflex_clone/models/model_movie.dart';
import 'package:netflex_clone/widgets/main_image.dart';
import 'package:netflex_clone/widgets/circle_slider.dart';
import 'package:netflex_clone/widgets/box_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Movie dummy data
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'black-panther.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'bbongflix_logo.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    })
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Stack(
        children: [
          Center(
            child: CarouselImage(
              movies: movies,
            ),
          ),
          TopBar(),
        ],
      ),
      CircleSlider(movies: movies),
      BoxSlider(
        movies: movies,
      )
    ]);
  }
}

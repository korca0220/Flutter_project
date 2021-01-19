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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(children: [
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
      ]),
    );
  }
}

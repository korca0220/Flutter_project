import 'package:flutter/material.dart';
import 'package:netflex_clone/models/model_movie.dart';
import 'package:netflex_clone/widgets/top_bar.dart';
import 'package:netflex_clone/widgets/main_image.dart';
import 'package:netflex_clone/widgets/circle_slider.dart';
import 'package:netflex_clone/widgets/box_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('movies').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: streamData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return _buildBody(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((e) => Movie.fromSnapshot(e)).toList();
    return ListView(children: [
      Stack(
        children: [
          Center(
            child: CarouselImage(movies: movies),
          ),
          TopBar()
        ],
      ),
      CircleSlider(movies: movies),
      BoxSlider(movies: movies)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: _fetchData(context),
    );
  }
}

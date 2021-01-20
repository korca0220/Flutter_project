import 'package:flutter/material.dart';
import 'package:netflex_clone/models/model_movie.dart';
import 'package:netflex_clone/screens/detail_screen.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  CarouselImage({this.movies});

  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie> movies;
  List<Widget> images;
  List<String> keywords;
  List<bool> likes;
  List<String> actors;
  List<String> producers;
  List<String> intros;
  int _currentPage = 0;
  String _mainPost = "";

  Color getBoxColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((e) => Image.network(e.poster)).toList();
    keywords = movies.map((e) => e.keyword).toList();
    likes = movies.map((e) => e.like).toList();
    actors = movies.map((e) => e.actor).toList();
    producers = movies.map((e) => e.producer).toList();
    intros = movies.map((e) => e.intro).toList();
    _mainPost = movies[0].poster;
  }

  void likeChanger() {
    setState(() {
      likes[_currentPage] = !likes[_currentPage];
      movies[_currentPage].reference.update({'like': likes[_currentPage]});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            height: 600,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(_mainPost), fit: BoxFit.fill),
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  children: [
                    likes[_currentPage]
                        ? IconButton(
                            icon: Icon(Icons.check), onPressed: likeChanger)
                        : IconButton(
                            icon: Icon(Icons.add), onPressed: likeChanger),
                    Text(
                      '내가 찜한 콘텐츠',
                      style: TextStyle(fontSize: 11),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateColor.resolveWith(getBoxColor)),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                      ),
                      Text(
                        '재생',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(
                              movie: movies[_currentPage],
                            );
                          }));
                        }),
                    Text(
                      '정보',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    )
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (int i = 0; i < list.length; i++) {
    results.add(
      Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i
                ? Color.fromRGBO(255, 255, 255, 0.9)
                : Color.fromRGBO(255, 255, 255, 0.4)),
      ),
    );
  }
  return results;
}

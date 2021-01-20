import 'package:flutter/material.dart';
import 'package:netflex_clone/models/model_movie.dart';

class DetailBottom extends StatefulWidget {
  final Movie movie;
  DetailBottom({this.movie});

  @override
  _DetailBottomState createState() => _DetailBottomState();
}

class _DetailBottomState extends State<DetailBottom> {
  bool _currentLike;

  @override
  void initState() {
    super.initState();
    _currentLike = widget.movie.like;
  }

  void likeChanger() {
    setState(() {
      _currentLike = !_currentLike;
      widget.movie.reference.update({'like': _currentLike});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _currentLike
                    ? IconButton(
                        icon: Icon(
                          Icons.check,
                          size: 25,
                        ),
                        onPressed: likeChanger)
                    : IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 25,
                        ),
                        onPressed: likeChanger),
                Text(
                  '내가 짐한 콘텐츠',
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.thumb_up_outlined,
                      size: 25,
                    ),
                    onPressed: () {}),
                Text(
                  '평가',
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.share,
                      size: 25,
                    ),
                    onPressed: () {}),
                Text(
                  '공유',
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

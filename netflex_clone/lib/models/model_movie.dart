import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title;
  final String keyword;
  final String poster;
  final String actor;
  final String producer;
  final String intro;
  final bool like;
  final DocumentReference reference;

  Movie.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'],
        actor = map['actor'],
        producer = map['producer'],
        intro = map['intro'];

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() {
    return "Movie<$title:$keyword>";
  }
}

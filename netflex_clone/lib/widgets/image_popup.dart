import 'package:flutter/material.dart';

class ImagePopup extends StatelessWidget {
  final ImageProvider image;
  ImagePopup({this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

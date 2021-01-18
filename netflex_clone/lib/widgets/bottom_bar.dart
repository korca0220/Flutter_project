import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        color: Colors.black,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.transparent,
          indicatorColor: Colors.red,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              child: Text(
                'Home',
                style: TextStyle(fontSize: 8),
              ),
            ),
            Tab(
              icon: Icon(Icons.search),
              child: Text(
                'Search',
                style: TextStyle(fontSize: 8),
              ),
            ),
            Tab(
              icon: Icon(Icons.save_alt),
              child: Text(
                'Save',
                style: TextStyle(fontSize: 8),
              ),
            ),
            Tab(
              icon: Icon(Icons.list),
              child: Text(
                'List',
                style: TextStyle(fontSize: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

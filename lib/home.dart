import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Icon(Icons.home),
      ),
      body: Container(
        child: Center(
          child: Text('Welcome to Home Page',
              style: TextStyle(fontSize: 30, color: Colors.green,fontFamily: 'Lobster')),
        ),
      ),
    );
  }
}

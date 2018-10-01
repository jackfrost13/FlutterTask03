import 'package:flutter/material.dart';
import 'appBody.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00acc1),
        title: Text(
          'Flutter Articles Database',
          style: TextStyle(color: Color(0xFF000000)),
        ),
      ),
      body: AppBody(),
    );
  }
}

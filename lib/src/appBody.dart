import 'dart:async';
import 'package:flutter/material.dart';
import 'flutter_articles.dart';
import 'customList.dart';
List<Data> _data = gendata;

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          _data.shuffle();
        });
        return;
      },
      child: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return customList(_data[index]);
        },
      ),
    );
  }
}

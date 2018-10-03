import 'dart:async';
import 'package:flutter/material.dart';
import 'customList.dart';
import 'dart:convert';

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('json/Database.json'),
      builder: (context, snapshot) {
        var mydata = json.decode(snapshot.data.toString());
        return RefreshIndicator(
          onRefresh: () async {

            setState(() {
              mydata.shuffle();
            });
            return await Future.delayed(Duration(seconds: 2));

          },
          child: ListView.builder(
            itemCount: mydata == null ? 0 : mydata.length,
            itemBuilder: (BuildContext context, int index) {
              return customList(mydata[index]);
            },
          ),
        );
      },
    );
  }
}

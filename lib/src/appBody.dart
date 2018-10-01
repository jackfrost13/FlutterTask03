import 'dart:async';

import 'package:flutter/material.dart';
import 'flutter_articles.dart';
import 'package:url_launcher/url_launcher.dart';

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
          return customList(index);
        },
      ),
    );
  }

  Widget customList(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        splashColor: Colors.teal[400],
        onTap: () async{
          if(await canLaunch(_data[index].url))
            launch(_data[index].url);
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  _data[index].icon,
                  fit: BoxFit.cover,
                  height: 50.0,
                  width: 50.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _data[index].text,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                          "By : ${_data[index].by}",
                        ),
                        Text(
                          "Posted : ${_data[index].age}",
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
//
  }
}

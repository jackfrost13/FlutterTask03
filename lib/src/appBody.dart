import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task03/src/customList.dart';
import 'dart:convert';

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  var mydata;

  void getdata() async
  {
    var input= await DefaultAssetBundle.of(context).loadString('json/Database.json');
    mydata = json.decode(input);
    print(mydata);
  }
  @override
  Widget build(BuildContext context) {
    if(mydata == null)getdata();
    return RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          setState(() {
            mydata.shuffle();
          });
          print("refresh $mydata");
        },
        child: ListView.builder(
          itemCount: mydata == null ? 0 : mydata.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0)print("$index 2nd  ${mydata[index]}");
            return customList(mydata[index]);
          },
        ),
      );
    }
  }


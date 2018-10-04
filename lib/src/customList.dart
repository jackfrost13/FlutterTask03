import 'package:flutter/material.dart';
import 'flutter_articles.dart';
import 'package:url_launcher/url_launcher.dart';

Widget customList(Data obj) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      borderRadius: BorderRadius.circular(30.0),
      splashColor: Colors.teal[400],
      onTap: () async {
        if (await canLaunch(obj.url)) launch(obj.url);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                obj.icon,
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
                    obj.text,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "By : ${obj.by}",
                      ),
                      Text(
                        "Posted : ${obj.age}",
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
}

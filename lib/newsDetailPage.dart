import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/newsModel.dart';

class NewsDetailPage extends StatefulWidget {
  Articles? articles;

  NewsDetailPage({this.articles});

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  var date;
  var height;
  @override
  void initState() {
    // TODO: implement initState

    DateTime now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    date = formatter.format(now);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: //Image.network(widget.articles!.urlToImage!,fit: BoxFit.fill,),
            Stack(children: [
      Container(
          decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.articles!.urlToImage!),
            fit: BoxFit.cover),
      )),
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black,
                ],
                stops: [
                  0.0,
                  1.0
                ])),
      ),
      Positioned(
        top: 30.0,
        left: 10,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.transparent.withOpacity(0.2),
          child: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      Positioned(
          bottom: 50.0,
          left: 24,
          top: 100,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(widget.articles!.title.toString(),
                          style: Theme.of(context).textTheme.headline1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 64),
                    width: MediaQuery.of(context).size.width - 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(widget.articles!.source!.name.toString(),
                              style: Theme.of(context).textTheme.headline2),
                        ),
                        Text(date.toString(),
                            style: Theme.of(context).textTheme.headline2),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 16),
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(widget.articles!.content!,
                          style: Theme.of(context).textTheme.headline4))
                ],
              ),
            ),
          )),
    ]));
  }
}

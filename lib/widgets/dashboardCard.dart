
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/model/newsModel.dart';

import '../newsDetailPage.dart';

class DashboardCard extends StatefulWidget
{
  Articles? articles;
  DashboardCard({this.articles});
  @override
  _dashboardCardState createState() => _dashboardCardState();
}

class _dashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetailPage(articles: widget.articles)),
        )
      },
      child: Container(
        margin: EdgeInsets.all(15),

        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(
//              offset: Offset(0.0, 1.0),
          color: Colors.black,
         blurRadius: 10.0,
        //  spreadRadius: 2
        ),]
        ),
        child: Stack(children: <Widget>[
          Container(
            child: widget.articles?.urlToImage !=null?
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
              child: Image.network(widget.articles!.urlToImage!),) :Container(color: Colors.black,),

          ),

          Positioned(
              bottom: 36.0,left: 10,
              child: Container(
                width: MediaQuery.of(context).size.width-50,

                child: Text(widget.articles!.title.toString(),style: Theme.of(context).textTheme.headline2),
              )),
          Positioned(
            bottom: 12.0,left: 10,
            child: Text(widget.articles!.source!.name.toString(),style: Theme.of(context).textTheme.headline3,)
          ),
        ]),
      ),
    );

  }
}
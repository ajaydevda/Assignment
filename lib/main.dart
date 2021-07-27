import 'package:flutter/material.dart';
import 'package:fluttertask/widgets/dashboardCard.dart';

import 'APICaller/newsApiCall.dart';
import 'model/newsModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF000000),
        backgroundColor: Color(0xFF464646),
        // Define the default font family.
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              color: Color(0xFFf2f2f2)),
          headline3: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFbababa)),
          headline4: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFbababa)),
        ),
      ),
      home: MyHomePage(title: 'H E A D L I N E S'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var call = NewsApiCall();
  var snackBar;

  NewsModel? data;

  @override
  void initState() {
    // TODO: implement initState

    apiCall();
    snackBar = SnackBar(
      content: const Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Reload',
        onPressed: () {
          apiCall();
        },
      ),
    );

    super.initState();
  }

  apiCall()
  {
    call.networkCall().then((value) {
      print(value.totalResults.toString());

      print(value.status);
      if (value.status == "ok") {
        setState(() {
          data = value;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

          child: ListView.builder(
        cacheExtent: 10000000,
        itemCount: data?.articles?.length ?? 0, //data?.totalResults
        itemBuilder: (context, index) {
          return DashboardCard(articles: data!.articles![index]);
        },
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

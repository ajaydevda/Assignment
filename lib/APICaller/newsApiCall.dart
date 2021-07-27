import 'dart:convert';

import 'package:fluttertask/model/newsModel.dart';
import 'package:http/http.dart' as http;

import '../api.dart';


class NewsApiCall {
  Future<NewsModel> networkCall({timeStamp, jsonPostdata, checkSum}) async {

    var response = await http.get(Uri.parse(newsApi), headers: {"Content-Type": "application/json"});

    print("response" + response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(response.body);
      NewsModel resData = NewsModel.fromJson(data);
      return resData;
     }
     else {

      print("Exception=======>");
      throw Exception();
    }
  }
}
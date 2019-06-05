import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;


Future<Map> _GetNews(type) async {
  final response =  await http.get('https://murmuring-temple-68258.herokuapp.com/api/news/'+type);
  print(response.body);
  return json.decode(response.body);
}

Future<Map> GetNews(String type) async {
  Future<Map> jsonNews =  _GetNews(type);
  print(jsonNews);
  //return; //jsonDecode(jsonNews);
  return jsonNews;
}

Future<Map> _GetDetails(url) async {
  final response =  await http.get('https://murmuring-temple-68258.herokuapp.com/api/detail/'+url);
  return json.decode(response.body);
}

Future<Map> GetDetails(String url) async {
  Future<Map> articles = _GetDetails(url);
  return articles;
}

Future<Map> _NewsType() async {
  final response =  await http.get('https://murmuring-temple-68258.herokuapp.com/api/newstype/');
  return json.decode(response.body);
}

Future<Map> NewsType() async {
  Future<Map> newsType = _NewsType();
  return newsType;
}

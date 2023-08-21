import 'package:community/http/my_dio.dart';
import 'package:community/page/home_page.dart';
import 'package:community/page/mine_page.dart';
import 'package:community/page/public_page.dart';
import 'package:community/page/search_detail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/post.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Comunity',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => Homepage(),
          '/search': (context) =>  SearchDetail(),
          '/mine': (context) => MinePage(),
          '/public':(context) => PublicPage(),
        },
        home: const Homepage());
  }
}

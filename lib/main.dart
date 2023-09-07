import 'package:community/http/my_dio.dart';
import 'package:community/page/forget_pwd_page.dart';
import 'package:community/page/home_page.dart';
import 'package:community/page/login.dart';
import 'package:community/page/mine_page.dart';
import 'package:community/page/public_page.dart';
import 'package:community/page/register.dart';
import 'package:community/page/search_detail.dart';
import 'package:community/page/very_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'const/page_const.dart';
import 'model/post.dart';
import 'page/post_detail.dart';

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
        initialRoute:  PageConst.login,
        routes: {
            PageConst.login: (context) => loginpage(),
        PageConst.register: (context) => registerpage(),
        PageConst.verify: (context) => verifypage(),
        PageConst.fpwd: (context) => forgetpwdpage(),
          '/home': (context) => Homepage(),
          '/search': (context) =>  SearchDetail(),
          '/mine': (context) => MinePage(),
          '/public':(context) => PublicPage(),
          '/post':(context) => PostDetail(),
        },
        home: const Homepage());
  }
}

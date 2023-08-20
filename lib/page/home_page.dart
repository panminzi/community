import 'package:community/database/tel_response.dart';
import 'package:community/http/my_dio.dart';
import 'package:community/widget/postList.dart';
import 'package:community/widget/search_bar.dart';
import 'package:flutter/material.dart';
import '../widget/bottom_navBar.dart';
import 'package:dio/dio.dart';

import '../widget/fab.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  dynamic result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchBar(),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        body: Text(result.toString()),
        floatingActionButton: Container(
          width: 60,
          height: 60,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.white),
          child: FloatingActionButton(
              child: Icon(Icons.add_box_outlined),
              onPressed: () {
                Navigator.of(context).pushNamed('/public');
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: BottomNavBar(),
        ));
  }

  void fun() async {
    MyDio myDio = MyDio();
    Response response =
        await myDio.get('/teladress', queryParameters: {'mobile': 15872027126});
    //  print(response.data['code']);
    // return response.data.result.name;
    TelResponse telResponse = TelResponse.fromJson(response.data);
//  print(telResponse.code);
    result = response.data;
    result = response.data;
    result = response.data;
  }
}

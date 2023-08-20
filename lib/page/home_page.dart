import 'package:community/http/my_dio.dart';
import 'package:community/model/post_model.dart';
import 'package:community/widget/search_bar.dart';
import 'package:flutter/material.dart';
import '../model/post.dart';
import '../utils/get_data.dart';
import '../widget/bottom_navBar.dart';
import 'package:dio/dio.dart';

import '../widget/fab.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

typedef AsyncWidgetBuilder<T> = Widget Function(
    BuildContext context, AsyncSnapshot<T> snapshot);

class _HomepageState extends State<Homepage> {
  Widget divider1 = Divider(
    color: Colors.amber,
  );
  dynamic title0;
  dynamic userName0;
  dynamic postTime0;
  dynamic labelContent0;
  @override
  void initState() {
    fun();
  }

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
          actions: [
            IconButton(
                onPressed: () {
                  fun();
                },
                icon: Icon(Icons.newspaper))
          ],
        ),
        body: ListView.builder(
            itemCount: 2,
            itemExtent: 90,
            itemBuilder: (context, index) {
              return ListTile(
                  title:
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.green,
                              //width: 1.0,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    //color: Colors.green,
                                    height: 50,
                                    width: 230,
                                    child: Expanded(
                                        child: Text(
                                      title0.toString(),
                                      style: TextStyle(
                                        fontSize: 25),
                                    )),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 164, 219, 166),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      height: 35,
                                      child: Text(
                                        "标签",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    // color: Colors.red,
                                    alignment: Alignment.bottomLeft,
                                    width: 220,
                                    height: 38,
                                    child:Row(
                                      children: [Icon(Icons.alarm),
                                     Text(
                                      postTime0.toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),],
                                    )
                                    
                                  ),
                                  Container(
                                    // color: Colors.amber,
                                    alignment: Alignment.bottomLeft,
                                    width: 80,
                                    height: 38,
                                    child: Text(
                                      userName0.toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                  ),
                                  GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        width: 40,
                                        alignment: Alignment.center,
                                        height: 25,
                                        child: Icon(Icons.send),
                                      ),
                                      onTap: () {})
                                ],
                              )
                            ],
                          )));
            }),
        floatingActionButton: Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: FloatingActionButton(
                child: Icon(Icons.accessibility),
                onPressed: () {
                  Navigator.of(context).pushNamed('/public');
                })),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: BottomNavBar(),
        ));
  }

  void fun() async {
    MyDio myDio = MyDio();
    Response response = await myDio.get(
        'https://yapi.pro/mock/65063/showPublishedPost',
        queryParameters: {'id': 202213407283});
    Post post = await Post.fromJson(response.data);
    // getData(post.title,post.labelContent,post.postTime,post.userName);
    setState(() {
      title0 = post.title;
      userName0 = post.userName;
      postTime0 = post.postTime;
      labelContent0 = post.labelContent;
    });
  }
}

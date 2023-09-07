import 'package:community/http/my_dio.dart';
import 'package:community/model/post_model.dart';
import 'package:community/widget/search_bar.dart';
import 'package:flutter/material.dart';
import '../model/post.dart';
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
  bool like = false;
  bool refresh = false;
  bool isCollect = false;
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
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://pic1.zhimg.com/v2-593bd035fe17f9099abe4c74fedfb5b7_r.jpg?source=1940ef5c"),
          fit: BoxFit.cover,
        )),
               child: Scaffold(
                backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor:Color.fromARGB(255, 55, 116, 144),
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
                    icon: Icon(Icons.autorenew))
              ],
            ),
            body: ListView.builder(
                itemCount: 1,
                itemExtent: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: GestureDetector(
                        child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              // color:Color.fromARGB(255, 230, 168, 189),
                              border: Border.all(
                                color: Colors.blueGrey,
                                //width: 1.0,
                              ),
                              //  color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      //color: Colors.green,
                                      height: 50,
                                      width: 280,
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          // Expanded(
                                          child: Text(
                                            title0.toString(),
                                            style: TextStyle(fontSize: 25),
                                          )),
                                    ),
                                    Container(
                                      //  color: Colors.red,
                                      height: 30,
                                      width: 20,
                                      child: Icon(
                                        color:Colors.black,
                                        Icons.loyalty,
                                        size: 18,
                                      ),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          // color: Color.fromARGB(255, 164, 219, 166),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        height: 30,
                                        child: Text(
                                          labelContent0.toString(),
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 18),
                                        )),
                                    //   IconButton(
                                    //       onPressed: () {
                                    //         Navigator.of(context).pushNamed('/post');
                                    //       },
                                    //       icon: Icon(Icons.send))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        // color: Colors.red,
                                        alignment: Alignment.bottomLeft,
                                        width: 270,
                                        height: 38,
                                        child: Row(
                                          children: [
                                            Icon(Icons.watch_later),
                                            Text(
                                              postTime0.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        )),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      width: 80,
                                      height: 38,
                                      child: Text(
                                        userName0.toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ),
                                    // 主页即有收藏点赞功能
                                    // Container(
                                    //   width: 12,
                                    // ),
                                    // Container(
                                    //   alignment: Alignment.bottomRight,
                                    //   width: 50,
                                    //   height: 38,
                                    //   child: GestureDetector(
                                    //     onTap: () {
                                    //       setState(() {
                                    //         like = !like;
                                    //       });
                                    //     },
                                    //     child: Icon(
                                    //       Icons.thumb_up,
                                    //       color: like ? Colors.red : Colors.grey,
                                    //     ),
                                    //   ),
                                    // ),
                                    // Container(
                                    //   alignment: Alignment.bottomCenter,
                                    //   width: 50,
                                    //   height: 38,
                                    //   child: GestureDetector(
                                    //     onTap: () {
                                    //       setState(() {
                                    //         isCollect = !isCollect;
                                    //       });
                                    //     },
                                    //     child: Icon(
                                    //       Icons.star,
                                    //       color:
                                    //           isCollect ? Colors.amber : Colors.grey,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                )
                              ],
                            ))),
                    onTap: () => Navigator.of(context).pushNamed('/post'),
                  );
                }),
            floatingActionButton: Container(
                width: 60,
                height: 60,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: FloatingActionButton(
                    child: Icon(Icons.accessibility),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/public');
                    })),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              child: BottomNavBar(),
            )));
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

f() {
  return CircularProgressIndicator(
    backgroundColor: Colors.red,
    valueColor: AlwaysStoppedAnimation(Colors.blue),
  );
}

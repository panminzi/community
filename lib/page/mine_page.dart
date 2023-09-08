import 'package:community/database/tel_response.dart';
import 'package:community/page/profile_screen_page.dart';
import 'package:community/widget/bottom_navBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://pic1.zhimg.com/v2-593bd035fe17f9099abe4c74fedfb5b7_r.jpg?source=1940ef5c'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 90, 10, 40),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: ClipOval(
                            child: Image.network(
                                "https://p6.itc.cn/images01/20220529/9cb36609100e4fc49488aa969653e317.jpeg",
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover),
                          ),
                          onTap: () {},
                        ),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 150, 0),
                            child: Text('山海',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16))),
                        TextButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                const Size(80, 60)), //按钮宽高设置
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(100, 30, 144, 255)), //背景色
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10))), //圆角
                          ),
                          child: const Text('编辑资料',
                              style: TextStyle(color: Colors.black)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const ProfileScreen();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                  UserDate()
                ],
              ),
            ),
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
}

Widget topInfo() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 90, 10, 40),
    child: Row(
      children: [
        GestureDetector(
          child: ClipOval(
            child: Image.network(
                "https://p6.itc.cn/images01/20220529/9cb36609100e4fc49488aa969653e317.jpeg",
                width: 80,
                height: 80,
                fit: BoxFit.cover),
          ),
          onTap: () {},
        ),
        const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 150, 0),
            child: Text('昵称',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16))),
        TextButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(80, 60)), //按钮宽高设置
            foregroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(100, 30, 144, 255)), //背景色
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))), //圆角
          ),
          child: const Text('编辑资料', style: TextStyle(color: Colors.blueAccent)),
          onPressed: () {},
        ),
      ],
    ),
  );
}

Widget UserDate() {
  return Container(
    margin: const EdgeInsets.all(8),
    height: 80,
    width: 360,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            TextButton(
                onPressed: () {},
                child: Column(
                  children: const [
                    Text(
                      "66",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Text(
                      "关注",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
          ],
        ),
        Column(
          children: [
            TextButton(
                onPressed: () {},
                child: Column(
                  children: const [
                    Text(
                      "66",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Text(
                      "收藏",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
          ],
        ),
        Column(
          children: [
            TextButton(
                onPressed: () {},
                child: Column(
                  children: const [
                    Text(
                      "66",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Text(
                      "点赞",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
          ],
        ),
      ],
    ),
  );
}

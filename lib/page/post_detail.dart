import 'package:community/http/my_dio.dart';
import 'package:community/model/post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  bool _showpublish = false;
  void _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        _showpublish = true;
      });
    } else {
      _showpublish = false;
    }
  }

  bool like = false;
  bool nolike = false;
  bool collected = false;
  dynamic title0;
  dynamic userName0;
  dynamic postTime0;
  dynamic labelContent0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fun();
  }

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://pic4.zhimg.com/v2-affd6b88da47f8647b430c2040dd3123_r.jpg?source=1940ef5c'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 227, 190, 202),
              title: Align(
                alignment: Alignment.center,
                child: Row(children: [
                  Icon(Icons.tablet_android),
                  Icon(Icons.mood_bad),
                  Icon(Icons.import_contacts),
                  Icon(Icons.insert_emoticon),
                  Text("阅读中"),
                ]),
              ),
              actions: [Icon(Icons.share)],
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: 50,
                  // color: Colors.amber,
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            title0.toString(),
                            style: TextStyle(fontSize: 25),
                          )),
                      Container(
                        width: 70,
                      ),
                      Icon(
                        Icons.loyalty,
                        size: 18,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(labelContent0.toString()),
                        ),
                      ),
                    ],
                  ),
                ),
                //帖子的相关属性
                Container(
                    height: 25,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                        ),
                        Icon(Icons.access_time),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              // color: Color.fromARGB(255, 158, 229, 195),
                              child: Text(postTime0.toString())),
                        ),
                        Container(
                          width: 180,
                        ),
                        Icon(Icons.perm_identity),
                        Container(
                            // color: Color.fromARGB(255, 158, 229, 195),
                            child: Text(userName0.toString()))
                      ],
                    )),
                //帖子的具体内容
                Container(
                    height: 420,
                    child: Column(
                      children: [
                        Text(
                          "但我不能放歌，",
                          style: TextStyle(fontSize: 19),
                        ),
                        Text(
                          "悄悄是别离的笙箫;",
                          style: TextStyle(fontSize: 19),
                        ),
                        Text(
                          "夏虫也为我沉默,",
                          style: TextStyle(fontSize: 19),
                        ),
                        Text(
                          "沉默是今晚的康桥!",
                          style: TextStyle(fontSize: 19),
                        )
                      ],
                    )),
                //评论区标志
                Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "评论区",
                            style: TextStyle(fontSize: 20),
                          ),
                        ])),
                //评论区输入框
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      width: 400,
                      height: 45,
                      child: Container(
                        height: 60,
                        //color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 45,
                              child: Row(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 390,
                                      margin:
                                          EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 237, 232, 234),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.mode_edit,
                                            color: Colors.grey,
                                          ),
                                          Expanded(
                                            child: TextField(
                                              cursorColor: Colors.black,
                                              autofocus: false,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 5, bottom: 10),
                                                border: InputBorder.none,
                                              ),
                                              controller:
                                                  _textEditingController,
                                              onChanged: _onChanged,
                                            ),
                                          ),
                                          Text(
                                            "发布",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: _showpublish
                                                    ? Colors.black
                                                    : Colors.grey),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ])
              ]),
            ),
            bottomNavigationBar: (Row(
              children: [
                Container(
                  height: 60,
                  width: 10,
                ),
                Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 214, 211),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Row(children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              like = !like;
                            });
                          },
                          icon: Icon(
                            Icons.thumb_up,
                            color: like == true && nolike == false
                                ? Colors.amber
                                : Colors.grey,
                          )),
                      Icon(Icons.more_vert),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              nolike = !nolike;
                            });
                          },
                          icon: Icon(
                            Icons.thumb_down,
                            color: like == false && nolike == true
                                ? Colors.red
                                : Colors.grey,
                          ))
                    ])),
                Container(
                  height: 20,
                  width: 220,
                  //   color: Colors.black,
                ),
                Icon(
                  Icons.insert_comment,
                  color: Colors.grey,
                ),
                Container(width: 10, height: 20),
                GestureDetector(
                  child: Icon(Icons.star,
                      color: collected ? Colors.amber : Colors.grey),
                  onTap: () {
                    setState(() {
                      collected = !collected;
                    });
                  },
                )
              ],
            ))));
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

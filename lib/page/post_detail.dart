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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Row(children: [
            Icon(Icons.tablet_android),
            Icon(Icons.mood_bad),
            Icon(Icons.import_contacts),
            Icon(Icons.insert_emoticon)
          ]),
        ),
        actions: [Icon(Icons.share)],
      ),
      body: Column(
        children: [
          Container(
              height: 50,
            //  color: Colors.amber,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title0.toString(),
                    style: TextStyle(fontSize: 25),
                  ))),
          Container(
              height: 25,
//       color: Colors.red,
              child: Row(
                children: [
                  Container(
                    width: 40,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(postTime0.toString()),
                  ),
                  Container(
                    width: 180,
                  ),
                  Text(userName0.toString())
                ],
              )),
          Container(
            height:420,
//color: Colors.amber,
          ),
          Container(
            height: 25,
            width: MediaQuery.of(context).size.width,
            //color: Colors.black,
            child: Row(children: [Text("评论区",style: TextStyle(fontSize: 20),),
            Icon(Icons.mode_edit)],
          ))
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            height: 60,
            width: 10,
            // color: Colors.red,
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
            child:
                Icon(Icons.star, color: collected ? Colors.amber : Colors.grey),
            onTap: () {
              setState(() {
                collected = !collected;
              });
            },
          )
        ],
      ),
    );
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

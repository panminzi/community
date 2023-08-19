import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../http/my_dio.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("我是空白"),
          );
        },
        separatorBuilder: (context, index) => Divider(
              height: 0,
              color: Color.fromARGB(255, 148, 202, 149),
            ));
  }
}

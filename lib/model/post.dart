import 'package:community/http/my_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class Post {
  String? title;
  String? userName;
  String? postTime;
  String? labelContent;

  Post({this.title, this.userName, this.postTime, this.labelContent});

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    userName = json['user_name'];
    postTime = json['post_time'];
    labelContent = json['label_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['user_name'] = this.userName;
    data['post_time'] = this.postTime;
    data['label_content'] = this.labelContent;
    return data;
  }
}

import 'package:dio/dio.dart';

import '../http/my_dio.dart';
import '../model/post.dart';

dynamic result = "";
  Future<Post> fetchPost() async {
    MyDio myDio = MyDio();
    Response response = await myDio.get(
        'https://yapi.pro/mock/65063/showPublishedPost',
        queryParameters: {'id': 202213407283});
    Post postModel = await Post.fromJson(response.data);
    return postModel;
  }
  FutureBuilder<Post>(
            //开始网络请求
            future: fetchPost(),
            builder: (BuildContext context, AsyncSnapshot<Post> snapshot) {
              //判断连接状态
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  print('没有状态');
                  return new Text('没有状态');
                case ConnectionState.waiting:
                  //加载中
                  print('加载中');
                  return new Center(
                    child: new CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  print('处理完成');
                  //处理完成失败/成功
                  if (snapshot.hasError) {
                    return new Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return PostModel();
                  }
                default:
                  return Text("错误了");
              }
            }),
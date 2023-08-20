import 'package:community/database/tel_response.dart';
import 'package:community/widget/bottom_navBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


import '../widget/fab.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //     onPressed: () async {
        //       MyDio myDio = MyDio();
        //       try {
        //         Response response = await myDio.get('/teladress',
        //             queryParameters: {'mobile': 15872027126});
        //         print(response.data);
        //         TelResponse telResponse = TelResponse.fromJson(response.data);
        //         print(telResponse.code.toString() + telResponse.result!.city!);
        //       } catch (error) {
        //         print('请求失败: $error');
        //       }
        //       // Map<String, dynamic> response = await myDio
        //       //     .get("/teladress", params: {"mobile": 15527700309});
        //       // TelResponse telResponse = TelResponse.fromJson(response);
        //       // print(telResponse.result!.city);
        //       // print(response);
        //     },
        //     //icon: Icon(Icons.query_builder)));
        body: FAB());
  }
}

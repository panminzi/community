import 'package:community/widget/search.dart';
import 'package:community/widget/search_history.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SearchDetail extends StatefulWidget {
  SearchDetail({super.key});

  @override
  State<SearchDetail> createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  @override
  var list = ['搞笑的','恶趣味'];
  clearHistory() {
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //隐藏左侧默认返回按钮
          title: Row(
            children: [
              Container(
                width: 320,
                child: SearchBars(),
              ),
              SearchText(context),
            ],
          ),
        ),
        body: SearchHistory(list: list, clearHistory: clearHistory));
  }

  //取消-富文本点击方式实现
  Text SearchText(BuildContext context) {
    return Text.rich(TextSpan(
      text: '搜索',
      style: const TextStyle(
          height: 2,
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          //Navigator.pop(context);
        },
    ));
  }
}

//import 'package:community/widget/search.dart';
import 'package:community/database/base_cache.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SearchDetail extends StatefulWidget {
  const SearchDetail({super.key});
  @override
  State<SearchDetail> createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  dynamic history;
  dynamic list1 = [];
  bool _showClear = false;
  dynamic t;
  BaseCache baseCache = BaseCache.getInstance();
  final TextEditingController _textEditingController = TextEditingController();
  void _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        history = text;
        _showClear = true;
      });
    } else {
      _showClear = false;
    }
  }

  var list = ["搞笑的"];
  clearHistory() {
    list.clear();
  }

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
              automaticallyImplyLeading: false, //隐藏左侧默认返回按钮
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 320,
                      child: Container(
                        height: 60,
                        //color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Container(
                                  // color: Colors.black,
                                  ),
                              height: 10,
                            ),
                            Container(
                              height: 45,
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 20,
                                  ),
                                  Container(
                                      height: 40,
                                      width: 280,
                                      margin:
                                          EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.zoom_in,
                                            color: Colors.black,
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
                                                hintText: '搜索',
                                              ),
                                              controller:
                                                  _textEditingController,
                                              onChanged: _onChanged,
                                            ),
                                          ),
                                          if (_showClear)
                                            GestureDetector(
                                              child: Icon(Icons.cancel,
                                                  size: 18, color: Colors.grey),
                                              onTap: () {
                                                _textEditingController.clear();
                                                setState(() {
                                                  _onChanged("");
                                                });
                                              },
                                            )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  GestureDetector(
                    child: SearchText(context),
                    onTap: () {
                      setState(() {
                        list.add(history);
                      });

                      //  print(list.length);
                    },
                  )
                ],
              ),
            ),
            body: Container(
                height: 300,
                // color: Colors.amber,
                child: Column(
                  // 设置内容靠左
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //添加一个padding
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '搜索历史',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                          Container(
                            width: 220,
                          ),
                          // 构建一个文本按钮
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Row(children: [
                                Text(
                                  list.isNotEmpty ? '清空历史' : '',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                if (list.isNotEmpty)
                                  Icon(Icons.restore_from_trash_outlined),
                              ]),
                            ),
                            onTap: () {
                              setState(() {
                                clearHistory();
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(2),
                        child: Wrap(
                          children: List.generate(
                              list.length, (index) => _listItem(list[index])),
                        ),
                      ),
                    )
                  ],
                ))));
  }

  //  构建子组件
  _listItem(String title) {
    // FittedBox用于调整其子部件的大小以适应可用空间
    return GestureDetector(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 92, 90, 90).withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            title,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
      onTap: () {
//_onChanged(title);
      },
    );
  }

  Text SearchText(BuildContext context) {
    return Text.rich(TextSpan(
      text: '搜索',
      style: const TextStyle(
          height: 2,
          color: Color.fromARGB(255, 77, 76, 76),
          fontSize: 18,
          fontWeight: FontWeight.w600),
    ));
  }
}

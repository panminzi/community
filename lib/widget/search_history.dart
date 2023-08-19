import 'package:flutter/material.dart';

/**
 * 搜索历史
 */

class SearchHistory extends StatefulWidget {
  List<String> list;
 final Function() clearHistory;
  SearchHistory({Key? key, required this.list, required this.clearHistory})
      : super(key: key) {
  list.removeWhere((element) => element.isEmpty);
  }
  @override
  State<StatefulWidget> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // 设置内容靠左
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //添加一个padding
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '搜索历史',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              // 构建一个文本按钮
              GestureDetector(
                onTap: () {
                  widget.clearHistory();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    widget.list.isNotEmpty ? '清空历史' : '',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(2),
            child: Wrap(
              children: List.generate(
                  widget.list.length, (index) => _listItem(widget.list[index])),
            ),
          ),
        )
      ],
    );
  }

  //  构建子组件
  _listItem(String title) {
    // FittedBox用于调整其子部件的大小以适应可用空间
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

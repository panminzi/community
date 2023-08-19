import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:community/page/search_detail.dart';

import '../database/base_cache.dart';

class str {
  var str0;
  getstr0() => str0;
  setstr0(var s) => str0 = s;
}

class SearchBars extends StatefulWidget {
  const SearchBars({super.key});

  @override
  State<SearchBars> createState() => _SearchBarsState();
}

class _SearchBarsState extends State<SearchBars> {
  bool _showClear = false;
  bool click = false;
  var list = [];

  final TextEditingController _textEditingController = TextEditingController();
  void _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        _showClear = true;
        click = true;
      });
    } else
      _showClear = false;
  }

  @override
  Widget build(BuildContext context) {
    BaseCache baseCache = BaseCache.getInstance();
    str str1;
    // str1.setstr0(baseCache.get('string') ?? 0);
    return Container(
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
                    width: 300,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.search,
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
                              contentPadding:
                                  EdgeInsets.only(left: 5, bottom: 10),
                              border: InputBorder.none,
                              hintText: '搜索',
                            ),
                            controller: _textEditingController,
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
    );
  }
}

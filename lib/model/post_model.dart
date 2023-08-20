import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostModel extends StatefulWidget {
  const PostModel({super.key});

  @override
  State<PostModel> createState() => _PostModelState();
}

class _PostModelState extends State<PostModel> {
  dynamic title0 = 0;
  dynamic userName0 = 0;
  dynamic postTime0 = 0;
  dynamic labelContent0 = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemExtent: 80,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Column(
            children: [
              Row(
                children: [
                  Container(
                    // color: Colors.green,
                    height: 30,
                    width: 240,
                    child: Expanded(
                        child: Text(
                      title0.toString(),
                      style: TextStyle(fontSize: 25),
                    )),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      height: 20,
                      child: Text(
                        "标签",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )),
                ],
              ),
              Row(
                children: [
                  Container(
                    // color: Colors.red,
                    alignment: Alignment.bottomLeft,
                    width: 220,
                    height: 25,
                    child: Text(
                      postTime0.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    alignment: Alignment.bottomLeft,
                    width: 80,
                    height: 25,
                    child: Text(
                      userName0.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  Container(
                    width: 35,
                  ),
                  GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        width: 40,
                        alignment: Alignment.center,
                        height: 25,
                        child: Icon(Icons.send),
                      ),
                      onTap: () {})
                ],
              )
            ],
          ));
        });
  }

  dynamic get_Title(dynamic t) {
    setState(() {
      title0 = t;
    });
  }

  dynamic get_labelContent(dynamic t) {
    setState(() {
      labelContent0 = t;
    });
  }

  dynamic get_postTime(dynamic t) {
    setState(() {
      postTime0 = t;
    });
  }

  dynamic get_userName(dynamic t) {
    setState(() {
      userName0 = t;
    });
  }
}

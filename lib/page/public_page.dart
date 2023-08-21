import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PublicPage extends StatefulWidget {
  const PublicPage({super.key});

  @override
  State<PublicPage> createState() => _PublicPageState();
}

class _PublicPageState extends State<PublicPage> {
  bool a = false;
  final TextEditingController _textEditingController = TextEditingController();
  void _onPressed() {}
  void _onChanged(String text) {
    if (text.length > 0)
      setState(() {
        a = true;
      });
    else
      setState(() {
        a = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("写说说"),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "发布",
                  style: TextStyle(
                      color: a == true ? Colors.white : Colors.grey,
                      fontSize: 18),
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 120),
                child: Column(children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 15),
                      height: 300,
                      width: 380,
                      decoration: new BoxDecoration(
//color: Colors.black,
                          border:
                              new Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: new BorderRadius.circular((10.0))),
                      child: Column(
                        children: [
                          TextField(
                            autofocus: true,
                            controller: _textEditingController,
                            onChanged: _onChanged,
                            maxLines: null,
                            minLines: 1,
                            decoration: InputDecoration(
                                enabledBorder: new UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: new UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)),
                          ),
                        ],
                      )),
                  Container(
//color: Colors.amber,
                      height: 50,
                      width: 350,
                      margin: EdgeInsets.only(left: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.picture_as_pdf_sharp),
                          label: Text("上传图片"),
                          onPressed: _onPressed,
                        ),
                      ))
                ]))));
  }
}

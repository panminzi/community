import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            width: 300,
            height: 45,
            padding: EdgeInsets.all(5),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      icon: Icon(Icons.search),
                      label: Text(
                        "搜索",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/search');
                      },
                    ),
                  ],
                )
              ],
            )));
  }
}

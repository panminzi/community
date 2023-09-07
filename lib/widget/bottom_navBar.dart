import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
     color: Color.fromARGB(255, 171, 204, 231),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
                height: 52,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.home),
                    Text(
                      "首页",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
            onTap: () => Navigator.of(context).pushNamed('/home'),
          ),
          Container(height: 52, child: Text(" ")),
          GestureDetector(
            child: Container(
                height: 52,
                child: Column(
                  children: [
                    Icon(Icons.radar),
                    Text(
                      "我的",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                )),
            onTap: () => Navigator.of(context).pushNamed('/mine'),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage("https://p6.itc.cn/images01/20220529/9cb36609100e4fc49488aa969653e317.jpeg"),
          ),
          Positioned(
            right: -10,
            bottom: 0,
            child: SizedBox(
              height: 46,width: 46,
              child: FloatingActionButton(onPressed: () {
                
              },
              backgroundColor: const Color.fromARGB(255, 233, 236, 247),
              elevation: 0,
              child:  const Icon(Icons.camera_alt_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

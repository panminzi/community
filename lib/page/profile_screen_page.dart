import 'package:flutter/material.dart';

import '../widget/profile_pic.dart';
import 'input_page.dart';
import 'mine_page.dart';

class ProfileScreen extends StatefulWidget {
  final String netName;
  final String name;
  final String age;
  final String gender;
  const ProfileScreen(
      {super.key,
      this.netName = "山海",
      this.name = "何子杰",
      this.age = "18",
      this.gender = "男"});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
             backgroundColor: Colors.transparent,
            title: const Text(
              "个人信息",
              style: TextStyle(
                color: Color.fromARGB(255, 95, 92, 92),
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const MinePage();
                  }));
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left_sharp,
                  size: 32,
                  color: Color.fromARGB(255, 95, 92, 92),
                )),
            centerTitle: true,
            elevation: 0,
          ),
          body: Column(
            children: [
              const ProfilePic(),
              const SizedBox(
                height: 20,
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: const Color(0xFFF5F6F9),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.person_outline_sharp,
                          color: Color.fromARGB(100, 30, 144, 255),
                          size: 32,
                        ),
                        title: const Text("昵称"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(widget.netName),
                            const Icon(
                              Icons.keyboard_arrow_right_sharp,
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const InputPage(
                              title: "编辑昵称",
                              hintText: "请输入昵称",
                              index: 1,
                            );
                          }));
                        },
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: const Color(0xFFF5F6F9),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.person_outline_sharp,
                          color: Color.fromARGB(100, 30, 144, 255),
                          size: 32,
                        ),
                        title: const Text("姓名"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(widget.name),
                            const Icon(Icons.keyboard_arrow_right_sharp)
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const InputPage(
                              title: "编辑姓名",
                              hintText: "请输入姓名",
                              index: 2,
                            );
                          }));
                        },
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: const Color(0xFFF5F6F9),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.person_outline_sharp,
                          color: Color.fromARGB(100, 30, 144, 255),
                          size: 32,
                        ),
                        title: const Text("性别"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(widget.gender),
                            const Icon(Icons.keyboard_arrow_right_sharp)
                          ],
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: ((context) {
                                return Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: const Text(
                                          "男",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return const ProfileScreen(
                                              gender: "男",
                                            );
                                          }));
                                        },
                                      ),
                                      const Divider(),
                                      ListTile(
                                        title: const Text("女",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 18)),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return const ProfileScreen(
                                              gender: "女",
                                            );
                                          }));
                                        },
                                      ),
                                      const Divider(),
                                      ListTile(
                                        title: const Text("保密",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 18)),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return const ProfileScreen(
                                              gender: "保密",
                                            );
                                          }));
                                        },
                                      ),
                                      const Divider(
                                        thickness: 7,
                                      ),
                                      ListTile(
                                        title: const Text("取消",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 18)),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }));
                        },
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: const Color(0xFFF5F6F9),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.person_outline_sharp,
                          color: Color.fromARGB(100, 30, 144, 255),
                          size: 32,
                        ),
                        title: const Text("年龄"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(widget.age),
                            const Icon(Icons.keyboard_arrow_right_sharp)
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const InputPage(
                              title: "编辑年龄",
                              hintText: "请输入年龄",
                              index: 3,
                            );
                          }));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

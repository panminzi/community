import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../const/page_const.dart';

class loginpage extends StatefulWidget {
  // const loginpage({super.key, required this.title});
  // final String title;

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  bool pwdShow = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
            'https://pic1.zhimg.com/v2-593bd035fe17f9099abe4c74fedfb5b7_r.jpg?source=1940ef5c'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("社区"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 45, top: 150, right: 45),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      validator: (v) {
                        return v!.trim().isNotEmpty ? null : "用户名不能为空";
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 45, top: 10, right: 45),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: IconButton(
                            icon: Icon(pwdShow
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                pwdShow = !pwdShow;
                              });
                            },
                          )),
                      obscureText: !pwdShow,
                      validator: (v) {
                        return v!.trim().length > 5 ? null : "密码不能少于6位";
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 1, right: 50),
                    child: Row(
                      children: [
                        TextButton(
                          child: Text("注册账号"),
                          onPressed: () {
                            Navigator.pushNamed(context, PageConst.register);
                          },
                        ),
                        Spacer(),
                        TextButton(
                          child: Text("?忘记密码"),
                          onPressed: () {
                            Navigator.pushNamed(context, PageConst.fpwd);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        child: Text("登录"),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
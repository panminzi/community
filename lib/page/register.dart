import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/page_const.dart';
import '../http/my_dio.dart';

class registerpage extends StatefulWidget {
  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  MyDio mydio = MyDio();
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  var passKey = GlobalKey();
  TextEditingController _controllername = new TextEditingController();
  TextEditingController _controllerPwd = new TextEditingController();
  TextEditingController _controllerRepwd = new TextEditingController();
  TextEditingController _controlleremail = new TextEditingController();
  bool pwdShow = false;
  bool repwdShow = false;
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
          title: Text("注册"),
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
                padding: const EdgeInsets.only(left: 50, top: 30, right: 50),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _controllername,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: "昵称",
                      hintText: "填写您的昵称",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    validator: (v) {
                      if (v!.length == 0) {
                        return "昵称为必填项";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, right: 50),
                child: Container(
                  width: double.infinity,
                  // height: 40,
                  child: TextFormField(
                    key: passKey,
                    autofocus: false,
                    controller: _controllerPwd,
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "填写密码",
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
                      if (v!.length == 0) {
                        return "密码为必填项";
                      } else if (v.length < 6) {
                        return "密码至少为6位字符.";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 5, right: 50),
                child: Container(
                  width: double.infinity,
                  // height: double.infinity,
                  child: TextFormField(
                    autofocus: false,
                    controller: _controllerRepwd,
                    decoration: InputDecoration(
                        labelText: "确认密码",
                        hintText: "再次输入密码",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: IconButton(
                          icon: Icon(repwdShow
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              repwdShow = !repwdShow;
                            });
                          },
                        )),
                    obscureText: !repwdShow,
                    validator: (v) {
                      var password = _controllerPwd.text;
                      if (v!.length == 0) {
                        return "密码为必填项";
                      } else if (v != password) {
                        return '密码不一致';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 10, right: 50),
                child: Container(
                  width: double.infinity,
                  // height: 60,
                  child: TextFormField(
                    autofocus: false,
                    controller: _controlleremail,
                    decoration: InputDecoration(
                        labelText: "邮箱",
                        hintText: "填写您的邮箱",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (v) {
                      return v!.trim().isNotEmpty ? null : "邮箱不能为空";
                    },
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60, top: 10),
                    child: ElevatedButton(
                      child: Text("验证码"),
                      onPressed: () {
                        if (_controllerPwd.text.length != 0 &&
                            _controllerRepwd.text.length != 0 &&
                            _controllername.text.length != 0 &&
                            _controlleremail.text.length != 0) {
                          // Response response = await mydio.get("");
                          Navigator.pushNamed(context, PageConst.verify);
                        }
                      },
                    ),
                  ),
                  Text("发送验证码到您的邮箱"),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tencent_im_plugin/tencent_im_plugin.dart';

import 'page/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // 初始化
    TencentImPlugin.init(appid: "1400290273");

    // 初始化本地存储
    TencentImPlugin.initStorage(identifier: "98a6f9541f1b455480bf460aa5208497");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  /// 登录
  onLogin() {
    TencentImPlugin.login(
      identifier: "98a6f9541f1b455480bf460aa5208497",
      userSig:
          "eJw1jksLgkAUhf-LrKPuTPMUWiVBGSnootqNOJMXScwspOi-J1rL8-gO502yfTp3fYOtI4FSSgLAbDSfriUBYXMgk74XlW0aLEhAOQAzwNRySrBwdYceR8BoK70RnHqacyG4htxzCdYKBpob9V-Dy1AuTXJa2-5Vpdoe0rPYVV0S1uEtPj6iXsfZhmEebqNyIWH1Azu8Dk*pUEJTbkB*vvMwNwA_",
    ).then((_) {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new HomePage()),
      );
    });
  }

  /// 退出登录
  onLogout() {
    TencentImPlugin.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: onLogin,
              child: Text("点击登录"),
            ),
            RaisedButton(
              onPressed: onLogout,
              child: Text("退出登录"),
            )
          ],
        ),
      ),
    );
  }
}
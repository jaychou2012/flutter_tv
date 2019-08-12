import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/tv_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // 强制横屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return MaterialApp(
      title: 'Flutter TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer timer;

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.black54,
      body: Center(
        child: Text(
          '芒果TV',
          style: TextStyle(
              fontSize: 50,
              color: Colors.deepOrange,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  _toPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => TVPage()),
      (route) => route == null,
    );
  }

  //倒计时处理
  static const timeout = const Duration(seconds: 3);

  startTimeout() {
    timer = Timer(timeout, handleTimeout);
    return timer;
  }

  void handleTimeout() {
    _toPage();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
    super.dispose();
  }
}

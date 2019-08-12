import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tv/utils/time_utils.dart';
import 'package:flutter_tv/widgets/tv_widget.dart';

import 'home_page.dart';
import 'list_page.dart';

class TVPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // 强制横屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return TVPageState();
  }
}

class TVPageState extends State<TVPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Timer timer;
  var timeString = TimeUtils.getTime();

  bool init = false;
  FocusNode focusNodeB0 = FocusNode();
  FocusNode focusNodeB1 = FocusNode();

  @override
  void initState() {
    super.initState();
    //initialIndex为初始选中第几个，length为数量
    _tabController = TabController(initialIndex: 0, length: 8, vsync: this);
    // 监听
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          break;
        case 1:
          break;
      }
    });

    focusNodeB0.addListener(() {
      if (focusNodeB0.hasFocus) {
        setState(() {
          _tabController.animateTo(0);
        });
      }
    });
    focusNodeB1.addListener(() {
      if (focusNodeB1.hasFocus) {
        setState(() {
          _tabController.animateTo(1);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: EdgeInsets.all(30),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: Icon(
            Icons.live_tv,
            color: Colors.deepOrange,
            size: 50,
          ),
          title: Text(
            '芒果TV',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontStyle: FontStyle.italic),
          ),
          primary: true,
          actions: <Widget>[
            FlatButton(
              child: Text(
                '$timeString',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          // 设置TabBar
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.deepOrange,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                child: TVWidget(
                  hasDecoration: false,
                  focusChange: (hasFocus) {
                    if (hasFocus) {
                      setState(() {
                        _tabController.animateTo(0);
                      });
                    }
                  },
                  child: Text(
                    '首页',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  requestFocus: true,
                ),
              ),
              Tab(
                  child: TVWidget(
                hasDecoration: false,
                focusChange: (hasFocus) {
                  if (hasFocus) {
                    setState(() {
                      _tabController.animateTo(1);
                    });
                  }
                },
                child: Text(
                  '精选',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
              Tab(
                  child: TVWidget(
                hasDecoration: false,
                focusChange: (hasFocus) {
                  if (hasFocus) {
                    setState(() {
                      _tabController.animateTo(2);
                    });
                  }
                },
                onclick: () {
                  print("点击");
                },
                child: Text(
                  '国产',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
              Tab(
                  child: TVWidget(
                hasDecoration: false,
                focusChange: (hasFocus) {
                  if (hasFocus) {
                    setState(() {
                      _tabController.animateTo(3);
                    });
                  }
                },
                child: Text(
                  '欧美',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
              Tab(
                child: TVWidget(
                  hasDecoration: false,
                  focusChange: (hasFocus) {
                    if (hasFocus) {
                      setState(() {
                        _tabController.animateTo(4);
                      });
                    }
                  },
                  child: Text(
                    '日漫',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Tab(
                child: TVWidget(
                  hasDecoration: false,
                  focusChange: (hasFocus) {
                    if (hasFocus) {
                      setState(() {
                        _tabController.animateTo(5);
                      });
                    }
                  },
                  child: Text(
                    '亲子',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Tab(
                child: TVWidget(
                  hasDecoration: false,
                  focusChange: (hasFocus) {
                    if (hasFocus) {
                      setState(() {
                        _tabController.animateTo(6);
                      });
                    }
                  },
                  child: Text(
                    '少综',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Tab(
                child: TVWidget(
                  focusChange: (hasFocus) {
                    if (hasFocus) {
                      setState(() {
                        _tabController.animateTo(7);
                      });
                    }
                  },
                  hasDecoration: false,
                  child: Text(
                    '分类',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            HomePage(),
            ListPage(),
            HomePage(),
            ListPage(),
            HomePage(),
            ListPage(),
            HomePage(),
            ListPage(),
          ],
        ),
      ),
    );
  }

  startTimeout() {
    timer = Timer.periodic(Duration(minutes: 1), (t) {
      setState(() {
        timeString = TimeUtils.getTime();
      });
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
      timer == null;
    }
    super.dispose();
  }
}

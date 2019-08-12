import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tv/widgets/tv_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Column(
              children: <Widget>[
                _buildItem(0),
                _buildItem(1),
                _buildItem(2),
              ],
            ),
            flex: 1,
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                _buildImageItem(3, 2),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        _buildImageItem(4, 1),
                        _buildImageItem(5, 1),
                      ],
                    )),
              ],
            ),
            flex: 4,
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                _buildImageItem(6, 2),
                _buildImageItem(7, 1),
              ],
            ),
            flex: 2,
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                _buildImageItem(8, 2),
                _buildImageItem(9, 1),
              ],
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  _buildItem(int index) {
    return Expanded(
      child: TVWidget(
          focusChange: (hasfocus) {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(0),
                color: _colors.elementAt(index),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _icons.elementAt(index),
                      _title.elementAt(index),
                    ],
                  ),
                ),
              ),
              onTap: () {
                _click(index);
              },
            ),
          )),
      flex: 1,
    );
  }

  _buildImageItem(int index, int flex) {
    return Expanded(
      child: TVWidget(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(0),
              color: _colors.elementAt(index),
              child: Container(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    ClipRRect(
                      child: Image.asset(
                        _images.elementAt(index),
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _title.elementAt(index),
                          index == 3
                              ? _des.elementAt(index)
                              : SizedBox(
                                  height: 0,
                                ),
                        ],
                      ),
                      color: _colors.elementAt(index).withAlpha(240),
                      padding: EdgeInsets.all(5),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              _click(index);
            },
          ),
        ),
        focusChange: (hasfocus) {},
      ),
      flex: flex,
    );
  }

  void _click(int index) {
    switch (index) {
      case 0:
        break;
      case 4:
//        Navigator.push(context, MaterialPageRoute(builder: (context) {
//          return AboutPage();
//        }));
        break;
    }
  }

  List<Icon> _icons = [
    Icon(
      Icons.search,
      size: 38,
      color: Colors.white,
    ),
    Icon(
      Icons.history,
      size: 38,
      color: Colors.white,
    ),
    Icon(
      Icons.event,
      size: 38,
      color: Colors.white,
    ),
    Icon(
      Icons.share,
      size: 38,
      color: Colors.deepPurpleAccent,
    ),
    Icon(
      Icons.error_outline,
      size: 38,
      color: Colors.orange,
    ),
    Icon(
      Icons.settings,
      size: 38,
      color: Colors.red,
    )
  ];

  List<String> _images = [
    'assets/htpy.jpg',
    'assets/htpy.jpg',
    'assets/htpy.jpg',
    'assets/htpy.jpg',
    'assets/agzz.jpg',
    'assets/amypj.jpg',
    'assets/hmjz.jpg',
    'assets/dxflqm.jpg',
    'assets/lifeandpi.jpg',
    'assets/nanasqc.jpg',
  ];

  List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.orange,
    Colors.orange,
    Colors.orange,
    Colors.orange,
  ];

  List<Text> _title = [
    Text(
      "搜索",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    Text(
      "历史",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    Text(
      "专题",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    Text(
      "环太平洋",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    Text(
      "阿甘正传",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    Text(
      "傲慢与偏见",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    Text(
      "黑猫警长",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    Text(
      "当幸福来敲门",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    Text(
      "Life Or PI",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
    Text(
      "哪啊哪啊神去村",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  ];

  List<Text> _des = [
    Text(
      "非常好看的电影",
      style: TextStyle(color: Colors.white, fontSize: 12),
    ),
    Text(
      "设置密码锁",
      style: TextStyle(color: Colors.white, fontSize: 12),
    ),
    Text(
      "吐槽反馈你的想法",
      style: TextStyle(color: Color.fromRGBO(162, 162, 162, 1), fontSize: 16),
    ),
    Text(
      "非常好看的电影",
      style: TextStyle(color: Colors.white, fontSize: 12),
    ),
    Text(
      "版本信息",
      style: TextStyle(color: Color.fromRGBO(162, 162, 162, 1), fontSize: 16),
    ),
    Text(
      "系统相关设置",
      style: TextStyle(color: Color.fromRGBO(162, 162, 162, 1), fontSize: 16),
    ),
    Text(
      "系统相关设置",
      style: TextStyle(color: Color.fromRGBO(162, 162, 162, 1), fontSize: 16),
    ),
  ];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

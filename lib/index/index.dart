import 'package:demo/index/camera/camera_page.dart';
import 'package:demo/index/home/home_page.dart';
import 'package:demo/index/idea/idea_page.dart';
import 'package:demo/index/market/market_page.dart';
import 'package:demo/index/navigation_icon_view.dart';
import 'package:demo/index/video/video_page.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin{

  int _currentIndex = 0;// 当前界面的索引值
  List<NavigationIconView> _navigationViews;  // 底部图标按钮区域
  List<StatefulWidget> _pageList;   // 用来存放我们的图标对应的页面
  StatefulWidget _currentPage;  // 当前的显示页面

  void _rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(icon: new Icon(Icons.accessible), title: new Text('首页'), tickerProvider: this),
      new NavigationIconView(icon: new Icon(Icons.all_inclusive), title: new Text('想法'), tickerProvider: this),
      new NavigationIconView(icon: new Icon(Icons.add_shopping_cart), title: new Text('市场'), tickerProvider: this),
      new NavigationIconView(icon: new Icon(Icons.camera_alt), title: new Text('相机'), tickerProvider: this),
      new NavigationIconView(icon: new Icon(Icons.music_video), title: new Text('视频'), tickerProvider: this),
    ];

    _navigationViews.forEach((element) {
      element.controller.addListener(_rebuild);
    });

    _pageList = <StatefulWidget>[
      new HomePage(),
      new IdeaPage(),
      new MarketPage(),
      new CameraPage(),
      new VideoPage(),
    ];

    _currentPage = _pageList[_currentIndex];


  }

  @override
  Widget build(BuildContext context) {

    BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((navigationIconViews) => navigationIconViews.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,// 设置底部导航工具栏的类型：fixed 固定
      onTap: (int index){
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      },

    );

    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
            child:_currentPage
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
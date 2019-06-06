import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:toast/toast.dart';

import '../pages/main/index.dart';
import '../pages/message//index.dart';
import '../pages/shoucang//index.dart';
import '../pages/user//index.dart';
import 'app_config.dart';

class Tinker {
  ///
  ///获取app主题
  ///
  static ThemeData getThemeData() {
    return ThemeData();
  }

  static final Dio _dio = Dio(BaseOptions(
    connectTimeout: AppConfig.AJAX_TIMEOUT,
    receiveTimeout: AppConfig.AJAX_TIMEOUT,
    baseUrl: AppConfig.AJAX_SERVER_API,
  ));

//  static BuildContext _buildContext;
//
//  static void initContext(BuildContext buildContext) {
//    _buildContext = buildContext;
//  }

  static void toast(
    BuildContext context,
    String msg,
  ) {
    OverlayState overlayState = Overlay.of(context);
  }

  ///网络请求
  static Future<Map> ajax(
    String url, {
    method: AppConfig.AJAX_METHOD_GET,
    values,
  }) async {
    print({
      "url": url,
      "method": method,
      "values": values,
    });
    Response response;
    if (method == AppConfig.AJAX_METHOD_GET) {
      response = await _dio.get(
        url,
        queryParameters: values ??= {},
      );
    } else {
      response = await _dio.post(
        url,
        queryParameters: values ??= {},
      );
    }
//    Tinker.toast();
    final _json = json.decode(response.data);
    if (response.statusCode == 200 && _json["statusCode"] == "200") {
      return _json;
    } else {
//      Tinker.toast();
    }
  }

  ///
  /// 创建轮播图
  ///
  static Swiper createSwiper({
    @required List<Widget> widgetList,
  }) {
    return Swiper(
      itemCount: widgetList.length,
      itemBuilder: (ctx, index) {
        if (index < widgetList.length) {
          return widgetList[index];
        } else {
          return null;
        }
      },
      pagination: SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          color: AppConfig.APP_COLOR_BACKGROUND,
          activeColor: AppConfig.APP_COLOR_THEME,
          activeSize: 7.0,
          size: 7.0,
        ),
      ),
      autoplay: true,
      viewportFraction: 1,
      scale: 0.8,
    );
  }
}

class TinkerScaffold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TinkerScaffoldState();
  }
}

class TinkerScaffoldState extends State<TinkerScaffold> {
  List<Widget> _screenList = List<Widget>();
  List<BottomNavigationBarItem> _itemList = List<BottomNavigationBarItem>();
  var _bottomAppBarItemList;
  int _currentIndex = 1;
  PageView _pageView;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initBottomTabBarList();
    _initScreenList();
    _initBottomAppVarItemList();
    _initPageController();
    _initPageView();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _pageView,
      bottomNavigationBar: AppConfig.IS_BOTTOM_FLOAT_ICON
          ? _createBottonAppBar()
          : _createBottonNavigationBar(),
      floatingActionButton: AppConfig.IS_BOTTOM_FLOAT_ICON
          ? FloatingActionButton(
              onPressed: () => {},
              child: AppConfig.BOTTOM_TAB_BAR_FLOAT_ICON,
              backgroundColor: AppConfig.BOTTOM_TAB_BAR_COLOR_SELECT,
            )
          : null,
      floatingActionButtonLocation: AppConfig.IS_BOTTOM_FLOAT_ICON
          ? FloatingActionButtonLocation.centerDocked
          : null,
    );
  }

  _switchTab(index) {
    setState(() {
      _currentIndex = index;
      _initBottomAppVarItemList();
    });
    _pageController.animateToPage(
      _currentIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  BottomAppBar _createBottonAppBar() {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 0,
        ),
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _bottomAppBarItemList,
        ),
      ),
      elevation: 20.0,
      shape: CircularNotchedRectangle(),
    );
  }

  BottomNavigationBar _createBottonNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      elevation: 10.0,
      onTap: (index) => _switchTab(index),
      items: _itemList,
      type: BottomNavigationBarType.fixed,
//      fixedColor: AppConfig.BOTTOM_TAR_BAR_COLOR[1],
      selectedItemColor: AppConfig.BOTTOM_TAB_BAR_COLOR_SELECT,
      unselectedItemColor: AppConfig.BOTTOM_TAB_BAR_COLOR,
      selectedFontSize: AppConfig.BOTTOM_TAB_BAR_TITLE_SIZE_SELECT,
      unselectedFontSize: AppConfig.BOTTOM_TAB_BAR_TITLE_SIZE,
      backgroundColor: Colors.white,
    );
  }

  ///初始化pagecontroller
  void _initPageController() {
    _pageController = PageController(
      initialPage: _currentIndex,
      keepPage: true,
    );
  }

  ///初始化pageviwe
  void _initPageView() {
    _pageView = PageView(
      controller: _pageController,
      children: _screenList,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  ///初始化底部导航栏，突起按钮样式
  void _initBottomAppVarItemList() {
    _bottomAppBarItemList = List<Widget>();
    for (var i = 0; i < AppConfig.BOTTOM_TAB_BAR_TITLE.length; i++) {
      _bottomAppBarItemList.add(
        InkWell(
          onTap: () => {
                _switchTab(i),
              },
          borderRadius: BorderRadius.all(Radius.circular(100)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(0x00, 0xff, 0xff, 0xff),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  i == _currentIndex
                      ? Image.asset(
                          AppConfig.BOTTOM_TAB_BAR_IMAGE_SELECT[i],
                          width: AppConfig.BOTTOM_TAB_BAR_IMAGE_WIDTH,
                          height: AppConfig.BOTTOM_TAB_BAR_IMAGE_HEIGHT,
                        )
                      : Image.asset(
                          AppConfig.BOTTOM_TAB_BAR_IMAGE[i],
                          width: AppConfig.BOTTOM_TAB_BAR_IMAGE_WIDTH,
                          height: AppConfig.BOTTOM_TAB_BAR_IMAGE_HEIGHT,
                        ),
                  Text(
                    AppConfig.BOTTOM_TAB_BAR_TITLE[i],
                    style: TextStyle(
                      fontSize: AppConfig.BOTTOM_TAB_BAR_TITLE_SIZE,
                      color: i == _currentIndex
                          ? AppConfig.BOTTOM_TAB_BAR_COLOR_SELECT
                          : AppConfig.BOTTOM_TAB_BAR_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      //为突起按钮留下位置
      if (i == 1) {
        _bottomAppBarItemList.add(
          GestureDetector(
            onTap: () => {
                  _switchTab(i),
                },
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(0x00, 0xff, 0xff, 0xff),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[],
                ),
              ),
            ),
          ),
        );
      }
    }
  }

  //初始化底部导航栏，无突起按钮
  void _initBottomTabBarList() {
    for (var i = 0; i < AppConfig.BOTTOM_TAB_BAR_TITLE.length; i++) {
      _itemList.add(BottomNavigationBarItem(
        icon: Image.asset(
          AppConfig.BOTTOM_TAB_BAR_IMAGE[i],
          width: AppConfig.BOTTOM_TAB_BAR_IMAGE_WIDTH,
          height: AppConfig.BOTTOM_TAB_BAR_IMAGE_HEIGHT,
        ),
        activeIcon: Image.asset(
          AppConfig.BOTTOM_TAB_BAR_IMAGE_SELECT[i],
          width: AppConfig.BOTTOM_TAB_BAR_IMAGE_WIDTH,
          height: AppConfig.BOTTOM_TAB_BAR_IMAGE_HEIGHT,
        ),
        title: Text(
          AppConfig.BOTTOM_TAB_BAR_TITLE[i],
        ),
      ));
    }
  }

  ///初始化页面路由
  void _initScreenList() {
    _screenList
      ..add(MessageIndex())
      ..add(MainIndex())
      ..add(ShoucangIndex())
      ..add(UserIndex());
  }
}

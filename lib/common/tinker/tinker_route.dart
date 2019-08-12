import 'package:flutter_web/material.dart';
import '../../page/test.dart';
import '../../page/home.dart';

/// @TODO 路由相关
class TinkerRouter {
  ///初始路由地址
  static final initRouterName = Home.routeName;

  ///路由映射关系
  static final routeMapper = <String, WidgetBuilder>{
    Home.routeName: (context) => Home(),
    Test.routeName: (context) => Test(),
  };

  ///跳转路由
  static Future navigateByName(BuildContext context, String routeName,
      {Map arguments}) async {
    return await Navigator.pushNamed(context, routeName,
        arguments: TinkerRouterParam(arguments));
  }

  ///返回上一级路由
  static bool navigatePop(BuildContext context, {Map arguments}) {
    Navigator.pop(context, TinkerRouterParam(arguments));
  }
}

///@TODO 路由参数
class TinkerRouterParam {
  Map data;

  TinkerRouterParam(this.data);
}

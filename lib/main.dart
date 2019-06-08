import 'package:flutter/material.dart';
import 'package:umeng_uapp/umeng_uapp.dart';

import 'package:toast/toast.dart';

import 'common/tinker.dart';
import 'common/app_config.dart';
import 'common/app_launch.dart';

void main() => runApp(MyApp());

/// app入口
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initUmengAnalytics();
//    _test();
  }

  void _test() async {
    Map data = await Tinker.ajax(
      "/api/vip/findOpenStatus",
      values: {
        "a": 1,
      },
    );
    print(data["rows"][0]["openStatus"]);
  }

  ///初始化友盟统计
  void _initUmengAnalytics() async {
    await UmengUapp.init(AppConfig.UMENG_IOS_APP_KEY);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.APP_NAME,
      theme: Tinker.getThemeData(),
      home: TinkerLaunch(),
      debugShowCheckedModeBanner: false,
    );
  }
}

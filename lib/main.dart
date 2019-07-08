import 'package:flutter/material.dart';
import 'dart:io';
import 'package:umeng_uapp/umeng_uapp.dart';

import 'common/tinker.dart';
import 'common/app_config.dart';
import 'common/app_launch.dart';

void main() => runApp(MyApp());

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
  }

  /// @TODO 初始化友盟统计
  void _initUmengAnalytics() {
    UmengUapp.init(Platform.isAndroid
        ? AppConfig.UMENG_ANDROID_APP_KEY
        : AppConfig.UMENG_IOS_APP_KEY);
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

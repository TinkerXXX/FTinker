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
  String result = "????";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initUmengAnalytics();
  }

  void _initUmengAnalytics() async {
    if (Platform.isAndroid) {
      result = await UmengUapp.init(
        AppConfig.UMENG_ANDROID_APP_KEY,
      );
    } else if (Platform.isIOS) {
      result = await UmengUapp.init(
        AppConfig.UMENG_IOS_APP_KEY,
      );
    }

    setState(() {
      result = result;
    });

    print(" ============ $result");
  }

  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Center(
//        child: Text(" ====== $result"),
//      ),
//    );

    return MaterialApp(
      title: AppConfig.APP_NAME,
      theme: Tinker.getThemeData(),
      home: TinkerLaunch(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter_web/material.dart';
import 'common/tinker_framework.dart';
import 'common/global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Global.APP_NAME,
      routes: TinkerRouter.routeMapper,
      initialRoute: TinkerRouter.initRouterName,
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'test.dart';
import '../common/tinker_framework.dart';

class Home extends TinkerStatefulWidget {
  static const routeName = "/";

  @override
  State createState() {
    return HomeState();
  }
}

class HomeState extends TinkerState {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  List markNeedsBuildKeys() {
    // TODO: implement rebuildReduxKeys
    return ["number"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olivia"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("${TinkerRedux.getState["number"]}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///跳转路由，携带参数
          TinkerRouter.navigateByName(context, Test.routeName,
              arguments: {"from": "home"});
        },
        child: Text(
          ">",
          style: TextStyle(
            color: Color.fromARGB(0xff, 0xff, 0xff, 0xff),
          ),
        ),
      ),
    );
  }
}

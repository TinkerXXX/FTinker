import 'package:flutter_web/material.dart';
import '../redux/test_handler.dart';
import '../common/tinker_framework.dart';

class Test extends TinkerStatefulWidget {
  static const routeName = "/test";

  @override
  State createState() => TestState();
}

class TestState extends TinkerState<Test> {
  @override
  List<String> markNeedsBuildKeys() {
    // TODO: implement markNeedsBuildKeys
    return ["number"];
  }

  @override
  Widget build(BuildContext context) {
    ///获取路由参数
    final Map param = super.getRouteParam();
    print("${param}");

    return Scaffold(
      appBar: AppBar(
        title: Text("Olivia"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("${TinkerRedux.getState["number"]}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ///由于是异步操作，所以需要async/await
          ///似乎对于开发者并不友好，需优化
          super.dispatch(
              await TestHandler.handle(TinkerRedux.getState["number"]));
        },
        child: Text(
          "+",
          style: TextStyle(
            color: Color.fromARGB(0xff, 0xff, 0xff, 0xff),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:sy_flutter_wechat/sy_flutter_wechat.dart';

class EditIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _test();
    // TODO: implement build
    return Center(
      child: MaterialButton(
        onPressed: () => {_test()},
        child: Text("test"),
      ),
    );
  }

  void _test() async {
//    bool flag = await SyFlutterWechat.register('wx4b5e0d93567cde79');
//    print(" ================ $flag");
  }
}

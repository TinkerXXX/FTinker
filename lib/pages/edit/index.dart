import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:sy_flutter_wechat/sy_flutter_wechat.dart';

class EditIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(0xff, 0xff, 0xff, 0xff)),
      child: Center(
        child: MaterialButton(
          onPressed: () => {_test(context)},
          child: Text("test"),
        ),
      ),
    );
  }

  void _test(context) async {
    Navigator.pop(context, "hi Tinker");
//    bool flag = await SyFlutterWechat.register('wx4b5e0d93567cde79');
//    print(" ================ $flag");
  }
}

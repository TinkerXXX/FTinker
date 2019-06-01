import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class MessageIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageIndexState();
  }
}

class MessageIndexState extends State<MessageIndex> {
  var _flag;
  final WX_APP_ID = "wx4b5e0d93567cde79";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _test();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(" ==== $_flag"),
        RaisedButton(
          onPressed: _shareText,
          child: Text("分享文本"),
        ),
        RaisedButton(
          onPressed: _shareImage,
          child: Text("分享图片"),
        ),
        RaisedButton(
          onPressed: _shareWebpage,
          child: Text("分享网页"),
        ),
        RaisedButton(
          onPressed: _payMoney,
          child: Text("微信支付"),
        ),
        RaisedButton(
          onPressed: _auth,
          child: Text("微信登录"),
        ),
      ],
    );
  }

  void _test() async {
//    bool flag = await SyFlutterWechat.register('wx4b5e0d93567cde79');
//    setState(() {
//      _flag = flag;
//    });
    var flag = await fluwx.register(appId: WX_APP_ID);
    setState(() {
      _flag = flag;
    });
  }

  void _shareText() async {
//    bool flag = await SyFlutterWechat.shareText('hello world',
//        shareType: SyShareType.session);

    var flag = await fluwx.share(fluwx.WeChatShareTextModel(
        text: "text from fluwx", scene: fluwx.WeChatScene.SESSION));
    setState(() {
      _flag = flag;
    });
  }

  void _shareImage() async {
    var flag = await fluwx.share(
      fluwx.WeChatShareImageModel(
        image: "assets://image/welcome.png",
        scene: fluwx.WeChatScene.SESSION,
        thumbnail: "assets://image/welcome.png",
      ),
    );
    setState(() {
      _flag = flag;
    });
  }

  void _shareWebpage() async {
    var flag = await fluwx.share(fluwx.WeChatShareWebPageModel(
        webPage: "https://www.baidu.com",
        title: "Flutter",
        description: "I love Flutter",
        thumbnail: "assets://image/banner1.png",
        scene: fluwx.WeChatScene.SESSION));
    setState(() {
      _flag = flag;
    });
  }

  void _payMoney() async {
    var flag = await fluwx.pay(
        appId: 'wx4b5e0d93567cde79',
        partnerId: '1900000109',
        prepayId: '1101000000140415649af9fc314aa427',
        packageValue: 'Sign=WXPay',
        nonceStr: '1101000000140429eb40476f8896f4c9',
        timeStamp: 1398746574,
        sign: '7FFECB600D7157C5AA49810D2D8F28BC2811827B',
        signType: '选填',
        extData: '选填');
    setState(() {
      _flag = flag;
    });
  }

  void _auth() async {
    var flag = await fluwx.sendAuth(
      scope: "snsapi_userinfo",
      state: "wechat_sdk_demo_test",
    );
    setState(() {
      _flag = flag;
    });
  }
}

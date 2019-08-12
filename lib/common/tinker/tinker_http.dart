import 'dart:convert' as convert;
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../global.dart';

class TinkerHttp {
  static final _headers = {
    "Accept": "application/json",
  };

  ///封装ajax请求，不对外提供访问
  static Future _ajax({@required String url, body}) async {
    String _url = Global.SERVER + url;
    http.Response response =
        await http.post(_url, headers: _headers, body: body);

    TinkerHttpResponse _tinkerHttpResponse = TinkerHttpResponse(
        (convert.jsonDecode(response.body))['statusCode'],
        (convert.jsonDecode(response.body))['msg'],
        (convert.jsonDecode(response.body))['data']);

    if (_tinkerHttpResponse.statusCode == 200) {
      return _tinkerHttpResponse.data;
    } else {

    }
    return null;
  }

  ///模拟用户登陆
  ///开发者只需要调用该方法即可，不需要关心网络请求的相关逻辑
  static Future userLogin(
      {@required String username, @required String password}) {
    String url = Global.SERVER + "/main/test";
    Map _body = {
      "username": username,
      "password": password,
    };
    return _ajax(url: "/main/test", body: _body);
  }
}

class TinkerHttpResponse {
  int statusCode;
  String msg;
  Map data;

  TinkerHttpResponse(this.statusCode, this.msg, this.data);
}

import '../common/tinker_framework.dart';

class TestHandler {
  static Future<TinkerReduxAction> handle(int number) async {
    ///制造异步数据
    final searchResults = await new Future.delayed(
      new Duration(seconds: 3),
      () => TinkerRedux.getState["number"] + 1,
    );

    ///模拟请求借口
    Map data =
        await TinkerHttp.userLogin(username: "admin", password: "123456");

    print(data);

    ///封装TinkerReduxAction
    TinkerReduxAction action = TinkerReduxAction(
        type: TinkerReduxActionType.MAIN, data: {"number": searchResults});

    ///返回action对象
    ///thunk_redux似乎没有被使用
    return action;
  }
}

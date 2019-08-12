import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../tinker_framework.dart';

///TODO redux相关
class TinkerRedux {
  ///初始化state
  static const _initState = {"number": 0};

  ///获取当前store状态
  static Map get getState {
    return _store.state;
  }

  ///广播action
  static dispatch(TinkerReduxAction action) {
    _store.dispatch(action);
    TinkerRxDart.reduxSub.add(action);
  }

  ///更新state
  static _reducer(state, action) {
    return Map()..addAll(state)..addAll(action.data);
  }

  ///初始化store
  static final Store _store = Store(
    TinkerRedux._reducer,
    initialState: TinkerRedux._initState,
    middleware: [thunkMiddleware],
  );
}

///@TODO action封装
class TinkerReduxAction {
  ///type似乎不被使用
  String type;

  ///todo似乎不被使用
  String todo;

  ///需要更新state的Map
  Map data;

  TinkerReduxAction({@required this.data, this.type, this.todo});
}

///@TODO 存储action type
///似乎不被使用
class TinkerReduxActionType {
  static const MAIN = "main";
}

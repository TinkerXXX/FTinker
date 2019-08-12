import 'dart:async';

import 'package:flutter_web/material.dart';
import '../tinker_framework.dart';

///TinkerFramework标准，所有StatefulWidget都应该继承该类
abstract class TinkerStatefulWidget extends StatefulWidget {}

///TinkerFramework标准，所有State都应该继承该类
abstract class TinkerState<T extends TinkerStatefulWidget> extends State<T> {
  ///
  /// 申明一个List，如果action的data的keys在该List中，则markNeedsBuild
  ///
  List markNeedsBuildKeys();

  ///
  ///封装了store.dispatch
  ///
  dynamic dispatch(TinkerReduxAction action) {
    TinkerRedux.dispatch(action);
  }

  ///获取路由传递参数，默认{}
  Map getRouteParam() {
    TinkerRouterParam _param = ModalRoute.of(context).settings.arguments;
    _param ??= TinkerRouterParam({});
    return _param.data;
  }

  ///
  /// 如果store有多级，需要转换成List，然后与action的data求交集
  /// 如果交集不为空，则markNeedsBuild
  /// 由于算法原因，暂不使用 Orz
  ///
  @deprecated
  _parseMapToList(nodeValue, {nodeKey, List list, bool isAction = false}) {
    list ??= [];
    if (nodeValue is Map) {
      for (var key in nodeValue.keys) {
        if (nodeKey != null) {
          return "${isAction ? key : "$key.${_parseMapToList(nodeValue[key], list: list, nodeKey: key)}"}";
        } else {
          if (nodeValue[key] is List) {
            list.addAll(
                _parseMapToList(nodeValue[key], list: list, nodeKey: key));
          } else {
            list.add(
                "${isAction && nodeValue[key] is String ? key : "$key.${_parseMapToList(nodeValue[key], list: list, nodeKey: key)}"}");
          }
        }
      }
    } else if (nodeValue is List) {
      List temp = [];
      nodeValue.forEach((item) {
        temp.add(
            "${nodeKey != null ? nodeKey + "." : ""}.${_parseMapToList(item, list: list, nodeKey: nodeKey)}");
      });
      return temp;
    } else {
      return nodeValue;
    }
    return list;
  }

  StreamSubscription _subscription;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    ///当页面dispose时取消监听，避免抛出警告，造成内存泄漏
    _subscription.cancel();
  }

  @override
  void initState() {
    super.initState();

    ///订阅rxdart的redux流，用于数据与界面同步
    ///保存Subscription索引，当dispose时取消监听
    _subscription = TinkerRxDart.reduxSub.stream.listen((action) {
      ///为了避免每次sub.add页面都会刷新，所以判断action.data是否影响当前widget
      List dataKeyList = action.data.keys.toList();
      List rebuildKeyList = markNeedsBuildKeys();
      for (var item in rebuildKeyList) {
        if (dataKeyList.contains(item)) {
          this.setState(() {});
          return;
        }
      }
    });
  }
}

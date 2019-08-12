import 'package:rxdart/rxdart.dart';
import '../tinker_framework.dart';

class TinkerRxDart {
  ///用于更新redux的rx流
  static var reduxSub = BehaviorSubject<TinkerReduxAction>();
}

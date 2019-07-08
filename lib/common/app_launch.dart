import 'dart:async';

import 'package:flutter/material.dart';

import 'tinker.dart';
import 'app_config.dart';

///@TODO APP欢迎页入口
class TinkerLaunch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TinkerLaunchState();
  }
}

class TinkerLaunchState extends State<TinkerLaunch>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animation = CurveTween(
      curve: Curves.fastOutSlowIn,
    ).animate(_animationController)
      ..addStatusListener(
        (status) => {
              if (AnimationStatus.completed == status)
                {
                  _timer = Timer(
                    Duration(milliseconds: 2000),
                    () => {
                          Navigator.of(context).pushAndRemoveUntil(
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 3000),
                              pageBuilder: (
                                ctx,
                                animation1,
                                animation2,
                              ) {
                                return TinkerScaffold();
                              },
                              transitionsBuilder: (
                                BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child,
                              ) {
                                return FadeTransition(
                                  opacity: Tween(
                                    begin: 0.0,
                                    end: 1.0,
                                  ).animate(CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.fastOutSlowIn)),
                                  child: child,
                                );
                              },
                            ),
                            (route) => route == null,
                          ),
                        },
                  ),
                },
            },
      );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(
      AppConfig.APP_LAUNCH_IMAGE,
      fit: BoxFit.cover,
    );
//    渐变动画
//    return FadeTransition(
//      child: widget._welcomeWidget,
//      opacity: _animation,
//    );
  }
}

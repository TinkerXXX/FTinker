import 'package:flutter/material.dart';
import '../pages/edit/index.dart';

final Router = <String, WidgetBuilder>{
  "/edit": (BuildContext context) {
    return new EditIndex();
  },
};

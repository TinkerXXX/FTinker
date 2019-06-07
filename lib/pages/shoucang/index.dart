import 'package:flutter/material.dart';
import 'package:my_flutter/common/tinker.dart';

class ShoucangIndex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Container(
        child: Tinker.Select_Image_picker(
            Image_height: 120,
            Image_width: 120,
            count: 5,
            line_count: 3,
            spacing: 13,
            runSpacing: 10,
            Click_Image_file: new Image.asset(
              "image/tianjiatupian.png",
              width: 120,
              height: 120,
              fit: BoxFit.fill,
            ),
            callback: (da) {
              print(da);
            }),
      ),
    );
  }
}
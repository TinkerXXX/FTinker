import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DongtaiItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DongtaiItemState();
  }
}

class DongtaiItemState extends State<DongtaiItem>
    with AutomaticKeepAliveClientMixin {
  Random random;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    random = Random();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: new Column(
        children: <Widget>[
          ClipRRect(
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.cover,
              placeholder: kTransparentImage,
              image:
                  'https://picsum.photos/${random.nextInt(100) + 200}/${random.nextInt(300) + 300}/',
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '新来的小妹',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        "image/banner1.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                    ),
                    Flexible(
                      child: Text(
                        "说出你的不开心让我开心",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    Flex(
                      mainAxisSize: MainAxisSize.min,
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipOval(
                          child: Image.asset(
                            "image/shijian@2x.png",
                            width: 12,
                            height: 12,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                        Text(
                          "2019-05-15 01:25:46",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(0xff, 0xcc, 0xcc, 0xcc),
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                    Flex(
                      mainAxisSize: MainAxisSize.min,
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipOval(
                          child: Image.asset(
                            "image/liulan@2x.png",
                            width: 12,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                        Text(
                          "123",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(0xff, 0xcc, 0xcc, 0xcc),
                          ),
                          overflow: TextOverflow.fade,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

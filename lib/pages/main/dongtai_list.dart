import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'dongtai_item.dart';

class DongtaiList extends StatefulWidget {
  int orderType;

  DongtaiList(
    this.orderType,
  ) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DongtaiListState();
  }
}

class DongtaiListState extends State<DongtaiList>
    with AutomaticKeepAliveClientMixin {
  List<Widget> dataList = List<Widget>();

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StaggeredGridView.countBuilder(
      addAutomaticKeepAlives: true,
      primary: true,
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      padding: EdgeInsets.all(10),
      itemCount: 10,
      itemBuilder: (context, index) => DongtaiItem(),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
    );
  }
}

class Dongtai {
  var title;

  Dongtai(this.title);
}

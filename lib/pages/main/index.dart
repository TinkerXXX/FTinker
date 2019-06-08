import 'package:flutter/material.dart';

import '../../common/app_config.dart';
import '../../common/tinker.dart';
import 'dongtai_list.dart';

class MainIndex extends StatefulWidget {
  @override
  State createState() {
    return MainIndexState();
  }
}

class MainIndexState extends State<MainIndex>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<Widget> _swiperList = List()
    ..add(Image.asset(
      "image/banner1.png",
      fit: BoxFit.fill,
    ))
    ..add(Image.asset(
      "image/banner2.png",
      fit: BoxFit.fill,
    ));

  List<String> _tabbarTitle = ["热门", "发布时间", "认证用户", "关注"];

  TabController _tabController;

  DongtaiList _dongtaiList;

  int _tabBarIndex = 0;

  PageView _indexPageView;
  PageController _indexPageController;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    Tinker.toast(super.context, "123");
    _tabController = TabController(
      length: _tabbarTitle.length,
      vsync: this,
      initialIndex: _tabBarIndex,
    );
    _dongtaiList = DongtaiList(_tabBarIndex);
  }

  Widget _createSwiper() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(bottom: 55.0),
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Tinker.createSwiper(
          widgetList: _swiperList,
        ),
      ),
    );
  }

  Widget _createTabbar() {
    return TabBar(
      tabs: _tabbarTitle.map((item) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(item),
        );
      }).toList(),
      controller: _tabController,
      isScrollable: true,
      indicatorColor: AppConfig.APP_COLOR_THEME,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2.0,
      unselectedLabelStyle: TextStyle(fontSize: 14.0),
      unselectedLabelColor: AppConfig.BOTTOM_TAB_BAR_COLOR,
      labelStyle: TextStyle(fontSize: 16.0),
      labelColor: AppConfig.BOTTOM_TAB_BAR_COLOR_SELECT,
      onTap: (index) => _switchTabBar(index),
    );
  }

  void _switchTabBar(index) {
    _tabBarIndex = index;
    setState(() {
      _dongtaiList = new DongtaiList(_tabBarIndex);
    });
  }

  Widget _createTabbarView() {
    return TabBarView(
      children: List<Widget>()
        ..add(DongtaiList(0))
        ..add(DongtaiList(1))
        ..add(DongtaiList(2))
        ..add(DongtaiList(3)),
      controller: _tabController,
    );
  }

  List<Widget> _headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        //1.在标题左侧显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮
//        leading: Icon(_selectedChoice.icon),

        //2. ? 控制是否应该尝试暗示前导小部件为null
        automaticallyImplyLeading: true,

        //3.当前界面的标题文字
//        title: Text(_selectedChoice.title),

        //4.一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；
        //对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
//        actions: <Widget>[
//          new IconButton(
//            // action button
//            icon: new Icon(choices[0].icon),
//            onPressed: () {
//              _select(choices[0]);
//            },
//          ),
//          new IconButton(
//            // action button
//            icon: new Icon(choices[1].icon),
//            onPressed: () {
//              _select(choices[1]);
//            },
//          ),
//          new PopupMenuButton<Choice>(
//            // overflow menu
//            onSelected: _select,
//            itemBuilder: (BuildContext context) {
//              return choices.skip(2).map((Choice choice) {
//                return new PopupMenuItem<Choice>(
//                  value: choice,
//                  child: new Text(choice.title),
//                );
//              }).toList();
//            },
//          )
//        ],

        //5.一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，
        // 可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: _createSwiper(),
          collapseMode: CollapseMode.pin,
        ),

        //6.一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏
        bottom: _createTabbar(),

        //7.? 材料设计中控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，
        // 当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值
        elevation: 8,

        //APP bar 的颜色，默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
        backgroundColor: Color.fromARGB(0xff, 0xf8, 0xf8, 0xf8),

        //App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
        brightness: Brightness.dark,

        //App bar 上图标的颜色、透明度、和尺寸信息。默认值为 ThemeData().primaryIconTheme
        iconTheme: ThemeData().primaryIconTheme,

        //App bar 上的文字主题。默认值为 ThemeData（）.primaryTextTheme
        textTheme: ThemeData().accentTextTheme,

        //此应用栏是否显示在屏幕顶部
        primary: true,

        //标题是否居中显示，默认值根据不同的操作系统，显示方式不一样,true居中 false居左
        centerTitle: true,

        //横轴上标题内容 周围的间距
        titleSpacing: NavigationToolbar.kMiddleSpacing,

        //展开高度
        expandedHeight: 200,

        //是否随着滑动隐藏标题
        floating: true,

        //tab 是否固定在顶部
        pinned: true,

        //与floating结合使用
        snap: false,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: _tabbarTitle.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: _headerSliverBuilder,
          body: _createTabbarView(),
        ),
      ),
    );
  }
}

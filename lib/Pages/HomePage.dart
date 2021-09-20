import 'package:coffe_web/Util/Keys.dart';
import 'package:coffe_web/Util/SizingInfo.dart';
import 'package:coffe_web/Values/ResponsiveApp.dart';
import 'package:coffe_web/Widgets/Components/Carousel.dart';
import 'package:coffe_web/Widgets/MobileComponents/MenuTap.dart';
import 'package:coffe_web/Widgets/MobileComponents/ShopAppBar.dart';
import 'package:coffe_web/Widgets/MobileComponents/ShopDrawer.dart';
import 'package:coffe_web/Widgets/WebComponents/Footer/Footer.dart';
import 'package:coffe_web/Widgets/WebComponents/Header/Body/MenuSection.dart';
import 'package:coffe_web/Widgets/WebComponents/Header/Body/SectionList.dart';
import 'package:coffe_web/Widgets/WebComponents/Header/Header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollPosition = 0;
  double _opacity = 0;

  late AutoScrollController
      autoScrollController; /**es el scroll de la pagina */
  bool _isVisible = false;
  late ResponsiveApp responsiveApp;

  _scrollListener() {
    setState(() {
      _scrollPosition = autoScrollController.position.pixels;
    });
  }

  @override
  void initState() {
    autoScrollController = AutoScrollController(
        //add this for advanced viewport boundary. e.g. SafeArea
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);

    autoScrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);

    _opacity = _scrollPosition < responsiveApp.opacityHeight
        ? _scrollPosition / responsiveApp.opacityHeight
        : 1;

    _isVisible = _scrollPosition >= responsiveApp.menuHeight;
    return Scaffold(
        /**CON KEY PODREMOS MODIFICAR NUESTRO SCAFFOLD */
        key: homeScaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: Visibility(
          visible: _isVisible,
          child: FloatingActionButton(
            onPressed: () => {autoScrollController.scrollToIndex(0)},
            child: Icon(Icons.arrow_upward),
          ),
        ),
        appBar: isMobileAndTablet(context)
            ? ShopAppBar(_opacity)
            : Header(_opacity),
        drawer: ShopDrawer(homeScaffoldKey),
        body: ListView(controller: autoScrollController, children: [
          Carousel(),
          SectionListView(autoScrollController),
          isMobileAndTablet(context)
              ? MenuTap()
              : SectionListView(autoScrollController),
          isMobileAndTablet(context) ? SizedBox.shrink() : Footer()
        ]));
  }
}

import 'package:coffe_web/Modelo/Menu.dart';
import 'package:coffe_web/Util/Keys.dart';
import 'package:coffe_web/Values/ResponsiveApp.dart';
import 'package:coffe_web/Values/StringApp.dart';
import 'package:coffe_web/Widgets/WebComponents/Header/Body/Container/MenuContainer.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'Container/SectionContainer.dart';

class MenuSection extends StatelessWidget {
  AutoScrollController _scrollController;
  MenuSection(this._scrollController);
  late ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    String tit = sectionMenuTitleStr;
    String subtit = sectionMenuSubTitleStr;

    responsiveApp = ResponsiveApp(context);

    return Column(
      children: [
        SectionContainer(homeScaffoldKey, tit, subtit, Colors.white),
        Padding(
            padding: responsiveApp.edgeInsetsApp.onlyExLargeTopEdgeInsets,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  menu.length,
                  (index) => MenuContainer(
                      index: index, onPress: () => scrollIndex(index + 1))),
            ))
      ],
    );
  }

  scrollIndex(index) {
    _scrollController.scrollToIndex(index);
  }
}

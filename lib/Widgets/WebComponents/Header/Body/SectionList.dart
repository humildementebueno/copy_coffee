import 'package:coffe_web/Modelo/Section.dart';
import 'package:coffe_web/Values/ResponsiveApp.dart';
import 'package:coffe_web/Widgets/WebComponents/Header/Body/MenuSection.dart';
import 'package:coffe_web/Widgets/WebComponents/Header/Body/ProductSection.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class SectionListView extends StatelessWidget {
  AutoScrollController autoScrollController;

  SectionListView(this.autoScrollController);
  late ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          sections.length + 1,
          /**se genera la lista y tambien se contea el tamano */
          (index) {
            return (index == 0)
                ? Padding(
                    padding: responsiveApp.edgeInsetsApp.allExLargeEdgeInsets,
                    child: addScroll(MenuSection(autoScrollController), 0))
                : Padding(
                    padding: responsiveApp.edgeInsetsApp.allExLargeEdgeInsets,
                    child:
                        addScroll(ProductSection(sections[index - 1]), index));
          },
        ));
  }

  addScroll(Widget child, index) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: autoScrollController,
      index: index,
      child: child,
    );
  }
}

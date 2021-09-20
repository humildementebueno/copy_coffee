import 'package:coffe_web/Modelo/Menu.dart';
import 'package:coffe_web/Modelo/Product.dart';
import 'package:coffe_web/Modelo/Section.dart';
import 'package:coffe_web/Values/ResponsiveApp.dart';
import 'package:coffe_web/Widgets/Components/ProductListView.dart';
import 'package:flutter/material.dart';

class MenuTap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MenuTapState();
}

class MenuTapState extends State<MenuTap> with TickerProviderStateMixin {
  late TabController _controller;
  late ResponsiveApp responsiveApp;
  int _selectedIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: menu.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    return Container(
      height: responsiveApp.menuTabContainerHeight,
      child: Padding(
        padding: responsiveApp.edgeInsetsApp.allLargeEdgeInsets,
        child: Column(
          children: <Widget>[
            TabBar(
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                controller: _controller,
                tabs: List.generate(
                    menu.length,
                    (index) => createTab(
                        index, menu[index].title, menu[index].image, context))),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  ProductListView(list: coffeesList),
                  ProductListView(list: drinksList),
                  ProductListView(list: cakesList),
                  ProductListView(list: sandwichesList),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  createTab(int index, String text, String image, BuildContext context) {
    return Tab(
      text: text,
      icon: Image.asset(
        image,
        color: _selectedIndex == index
            ? Theme.of(context).iconTheme.color
            : Theme.of(context).unselectedWidgetColor,
        fit: BoxFit.fill,
        height: responsiveApp.tabImageHeight,
      ),
    );
  }
}

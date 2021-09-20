import 'package:coffe_web/Values/ResponsiveApp.dart';
import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  late String title, subTitle;
  late Color color;
  late ResponsiveApp responsiveApp;
  SectionContainer(
    Key key,
    this.title,
    this.subTitle,
    this.color,
  ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    return Container(
      width: responsiveApp.width,
      /**pantalla completa */
      child: Row(
        children: [
          Container(
            margin: responsiveApp.edgeInsetsApp.onlyMediumRightEdgeInsets,
            padding: responsiveApp.edgeInsetsApp.onlyLargeBottomEdgeInsets,
            width: responsiveApp.sectionWidth,
            height: responsiveApp.sectionHeight,
            color: Colors.black,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: Theme.of(context).accentTextTheme.bodyText1,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white, fontSize: responsiveApp.headline2),
              )
            ],
          )
        ],
      ),
    );
  }
}

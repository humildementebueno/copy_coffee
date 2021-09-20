import 'package:coffe_web/Values/ResponsiveApp.dart';
import 'package:flutter/material.dart';
import 'package:coffe_web/Values/StringApp.dart';
import 'HeaderButton.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  /**PreferredSizeWidget sirve para poder personalizar un appbar */
  final double opacity;
/**opacity nos ayudara a que el appbar cambie claro a oscuro */
  Header(this.opacity);

  @override
  _HeaderState createState() => _HeaderState();

  Size get preferredSize => Size.fromHeight(
      kToolbarHeight); /**kToolbarHeight este es un tamaño ya definido o podriamos poenrle 800 */
}

class _HeaderState extends State<Header> {
  late ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);

    return Container(
      color: Theme.of(context).primaryColor.withOpacity(widget.opacity),
      child: Padding(
        padding: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              shopStr,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: responsiveApp.headline6,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                letterSpacing: responsiveApp.letterSpacingHeaderWidth,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: responsiveApp.barSpace1Width),
                  HeaderButton(0, aboutUsStr),
                  SizedBox(width: responsiveApp.barSpace1Width),
                  HeaderButton(1, locationStr),
                ],
              ),
            ),
            HeaderButton(
              2,
              loginStr,
              lineIsVisible: false,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.local_grocery_store_outlined),
              /**colocamos transparente para que no halla ningun efecto */
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

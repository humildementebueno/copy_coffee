import 'package:coffe_web/Modelo/Product.dart';
import 'package:coffe_web/Values/ResponsiveApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductContainer extends StatelessWidget {
  Product product;
  var onPress;

  ProductContainer(this.product, {this.onPress});

  late ResponsiveApp responsiveApp;

  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    return InkWell(
      onTap: onPress,
      child: Container(
        height: responsiveApp.productContainerWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.title
                  .toUpperCase(), /**para que el texto se convierta a mayusculas */
            ),
            Text(product.price),
          ],
        ),
      ),
    );
  }
}

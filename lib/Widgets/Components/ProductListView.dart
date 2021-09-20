import 'package:coffe_web/Widgets/Components/ProductoContainer.dart';
import 'package:flutter/material.dart';
import 'package:coffe_web/Modelo/Product.dart';

class ProductListView extends StatelessWidget {
  List<Product> list;
  ProductListView({required this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      /**se adapta a todo nuestro contenedor */
      itemBuilder: (context, index) {
        return ProductContainer(list[index], onPress: () {});
      },
    );
  }
}

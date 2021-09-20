import 'package:coffe_web/Modelo/Product.dart';
import 'package:coffe_web/Modelo/Section.dart';
import 'package:coffe_web/Util/Keys.dart';
import 'package:coffe_web/Widgets/Components/ProductListView.dart';
import 'package:flutter/material.dart';

import 'Container/SectionContainer.dart';

class ProductSection extends StatelessWidget {
  Section section;
  //List<Product>  listaproduct1;
  //late List<Product> listaproduct = Product(section.list);
  // late List<Product> listaproduct1 = listaproduct.elementAt(0);
  ProductSection(this.section);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionContainer(
            homeScaffoldKey, section.title, section.subtitle, section.color),
        ProductListView(
            list: List.castFrom(section
                .list)), /**esto sirve para castear de un objeto a otro */
      ],
    );
  }
}

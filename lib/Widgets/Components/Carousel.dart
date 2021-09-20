import 'package:coffe_web/Util/SizingInfo.dart';
import 'package:coffe_web/Values/ResponsiveApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffe_web/Modelo/Carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  late ResponsiveApp responsiveApp;

  List<Widget> generateImageTiles() {
    /**en carousel tendremos las lista de imagenes */
    return carousel
        .map(
          (element) => ClipRRect(
            /**damos bordes a la imagen */
            borderRadius:
                BorderRadius.circular(responsiveApp.carouselRadiusWidth),
            child: Image.asset(
              element.image,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    var imageSliders = generateImageTiles(); /**aqui generamos las imagenes */

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              scrollPhysics: isMobileAndTablet(context)
                  ? PageScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              /**condicion de tamaño para mostrar otro tipo de vista responsiva*/
              enlargeCenterPage: true,
              /**para que se active las imagenes en la pagina */
              autoPlay: true,
              /**automaticamente pasan las imagenes */
              aspectRatio: 18 / 8,
              /**ancho/alto ,significa 18 partes del ancho * 8 partes del alto*/
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  /**con este for asignamos los puntos encendidos de imagenes para saber la ubicaicon de cada imagen */
                  for (int i = 0; i < carousel.length; i++)
                    carousel[i].isSelected = (i == index) ? true : false;
                });
              }),
          carouselController: _controller,
        ),
        Positioned.fill(
            /**Positioned.fill para que nuestro texto ocupe todo el tamaño del carrosel */
            child: Center(
          child: Text(
            carousel[_current].title,
            /**_current es el index de la imagen actual */
            style: TextStyle(
              letterSpacing: responsiveApp.letterSpacingCarouselWidth,
              fontFamily: 'Electrolize',
              fontSize: responsiveApp.headline3,
            ),
          ),
        )),
        isMobileAndTablet(context)
            ? Container()
            : Positioned.fill(
                child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: responsiveApp.carouselContainerWidth,
                    height: responsiveApp.carouselContainerHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          carousel.length,
                          (index) => InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () {
                                  _controller.animateToPage(index);
                                },
                                child: Container(
                                  width: responsiveApp
                                      .carouselCircleContainerWidth,
                                  height: responsiveApp
                                      .carouselCircleContainerHeight,
                                  margin: responsiveApp
                                      .edgeInsetsApp.allSmallEdgeInsets,
                                  decoration: BoxDecoration(
                                      color: carousel[index].isSelected
                                          ? Colors.white
                                          : Colors.blueGrey,
                                      shape: BoxShape.circle),
                                ),
                              )),
                    )),
              ))
      ],
    );
  }
}

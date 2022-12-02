import 'package:applistadozapatos/main.dart';
import 'package:applistadozapatos/temas/colores.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:card_swiper/card_swiper.dart';

class DetaProducto extends StatefulWidget {
  final idprod;
  final nombre;
  final descripcion;
  final precio;
  final marca;
  final stock;
  final tallas;
  final color;
  final img1;
  final img2;
  final img3;

  const DetaProducto({
    super.key,
    required this.idprod,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.marca,
    required this.tallas,
    required this.color,
    required this.stock,
    required this.img2,
    required this.img3,
    required this.img1,
  });

  @override
  State<DetaProducto> createState() => _DetaProductoState();
}

class _DetaProductoState extends State<DetaProducto> {
  @override
  Widget build(BuildContext context) {
    var anchodeta = MediaQuery.of(context).size.width;
    var altodeta = MediaQuery.of(context).size.height;
    var id = widget.idprod;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: spotApp(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.01),
              child: Center(
                child: Container(
                    width: size.width,
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(0.05),
                      child: _swiperImage(),
                    ),
                    decoration: BoxDecoration(color: Colors.black26)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Text(
                widget.marca + " " + widget.nombre,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 26),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                  width: 75,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                    child: Center(
                      child: Text(
                        "\$" + widget.precio,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.black45)),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Row(
                children: [
                  Text(
                    "Tallas disponibles:",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "Cantidad de Unidades: ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Row(
                children: [
                  Text(
                    "US " + widget.tallas,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    widget.stock,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Row(
                children: [
                  Text(
                    "Colores disponibles:",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Row(
                children: [
                  Text(
                    widget.color,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Row(
                children: [
                  Text(
                    "Descripción:",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    width: size.width - 40,
                    child: Text(
                      widget.descripcion,
                      maxLines: 10,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //barra superior
  spotApp() {
    return AppBar(
      backgroundColor: primario,
      elevation: 10,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "DETALLE PRODUCTO",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 22,),
              IconButton(
                icon: Icon(
                  FeatherIcons.moreVertical,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AppListadoZapatos()));
                }),
            ]),
      ),
    );
  }

  Widget _swiperImage() {
    List<String> imagenesProducto = [widget.img1, widget.img2, widget.img3];
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          imagenesProducto[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: 3,
      pagination: new SwiperPagination(),
    );
  }
}

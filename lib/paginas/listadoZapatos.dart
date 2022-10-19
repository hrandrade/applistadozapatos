import 'package:applistadozapatos/paginas/terminosyc.dart';
import 'package:applistadozapatos/temas/colores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ListZapatos extends StatefulWidget {
  const ListZapatos({Key? key}) : super(key: key);
  //final dynamic zapatos;

  @override
  State<ListZapatos> createState() => _ListZapatosState();
}

class _ListZapatosState extends State<ListZapatos> {
  dynamic drodownvalues = "Jordan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: negro,
      appBar: spotApp(),
      //body: cuerpoSpot(),
    );
  }

  //barra superior
  spotApp() {
    return AppBar(
      backgroundColor: primario,
      elevation: 10,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child:
            Row(children:[
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              "LISTADO DE ZAPATERIA",
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
                icon: Icon(
                  FeatherIcons.search,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TerminosyC()));
                }),
          )
        ]),
      ),
    );
  }

}
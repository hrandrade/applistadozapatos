import 'package:applistadozapatos/temas/colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TerminosyC extends StatefulWidget {
  const TerminosyC({Key? key, this.terminosyc}) : super(key: key);
  final dynamic terminosyc;

  @override
  State<TerminosyC> createState() => _TerminosyCState();
}

class _TerminosyCState extends State<TerminosyC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: negro,
      body: spotCuerpo(),
    );
  }

  //barra superior
  spotApp() {
    return AppBar(
      backgroundColor: primario,
      elevation: 10,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              "Acerca de esta App",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }

  //cuerpo de la clase
  Widget spotCuerpo() {
     return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spotApp(),
        //bloque 1
        Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            width: 350,
            height: 550,
            decoration: BoxDecoration(
              image: DecorationImage(
                                  image: AssetImage('assets/images/terminosyc.jpg'),
                                  fit: BoxFit.cover),
              color: gris,
            ),
          ),
        ),
      ],
    ));
  }
}
import 'package:applistadozapatos/paginas/configuracion.dart';
import 'package:applistadozapatos/temas/colores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:page_transition/page_transition.dart';

class Contacto extends StatefulWidget {
  const Contacto({
    Key? key,
  }) : super(key: key);

  @override
  State<Contacto> createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
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
                                  image: AssetImage('assets/images/contacto.jpg'),
                                  fit: BoxFit.cover),
              color: gris,
            ),
          ),
        ),
      ],
    ));
  }
}

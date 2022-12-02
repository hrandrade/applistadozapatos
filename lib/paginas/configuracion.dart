import 'package:applistadozapatos/main.dart';
import 'package:applistadozapatos/paginas/contacto.dart';
import 'package:applistadozapatos/paginas/terminosyc.dart';
import 'package:applistadozapatos/temas/colores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:page_transition/page_transition.dart';

class Configuracion extends StatefulWidget {
  const Configuracion({Key? key}) : super(key: key);

  @override
  State<Configuracion> createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: negro,
      //appBar: spotApp(),
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
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                icon: Icon(
                  FeatherIcons.arrowLeft,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AppListadoZapatos()));
                }),
          ),
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
          padding: const EdgeInsets.only(right: 1, left: 1),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Contacto()));              
            },
            child: Container(
              width: 400,
              height: 55,
              decoration: BoxDecoration(
                color: gris,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "Contacto",
                  style: TextStyle(
                      fontSize: 15, color: blanco, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 1, left: 1),
          child: GestureDetector(
            onTap: () {
              //cambio de wiget top
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TerminosyC()));
              //fin cambio de widget top
            },
            child: Container(
              width: 400,
              height: 55,
              decoration: BoxDecoration(
                color: gris,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "Términos y Condiciones",
                  style: TextStyle(
                      fontSize: 15, color: blanco, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

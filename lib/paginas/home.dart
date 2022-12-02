import 'package:applistadozapatos/paginas/buscarProducto.dart';
import 'package:applistadozapatos/paginas/terminosyc.dart';
import 'package:applistadozapatos/temas/colores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blanco,
      appBar: spotApp(),
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
                  FontAwesomeIcons.magnifyingGlass,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BuscarProducto()));
                }),
          )
        ]),
      ),
    );
  }
  //cuerpo de la clase
  spotCuerpo(){
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         //primer bloque
        SizedBox(
          height: 120,
        ),
        Center(
          child: Container(
            width: 250,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpg'), fit: BoxFit.cover),
                color: primario,
                ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],),
    );
  }
}

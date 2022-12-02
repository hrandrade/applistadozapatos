import 'package:applistadozapatos/paginas/configuracion.dart';
import 'package:applistadozapatos/paginas/home.dart';
import 'package:applistadozapatos/paginas/listadoZapatos.dart';
import 'package:applistadozapatos/temas/colores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contenedores extends StatefulWidget {
  const Contenedores({Key? key}) : super(key: key);

  @override
  State<Contenedores> createState() => _ContenedoresState();
}

class _ContenedoresState extends State<Contenedores> {
  int menu_activo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: spotFooter(),
      body: spotBody(),
    );
  }

  //cuerpo
   Widget spotBody() {
    return IndexedStack(index: menu_activo, children: [
      Home(),
      ListZapatos(),
      Configuracion(),
    ]);
  }

  //barra inferior
  Widget spotFooter(){
   List items = [
      FontAwesomeIcons.houseChimney,
      FontAwesomeIcons.listCheck,
      FontAwesomeIcons.gear,
   ];

    return Container(
      height: 45,
      decoration: BoxDecoration(color: primario),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(3, (index) {
            return IconButton(
                onPressed: () {
                  setState(() {
                    menu_activo = index;
                  });
                },
                icon: Icon(
                  items[index],
                  color: menu_activo == index ? Colors.blue : Colors.white,
                ));
          }),
        ),
      ),
    );

  }

}
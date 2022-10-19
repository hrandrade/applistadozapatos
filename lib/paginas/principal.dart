import 'package:applistadozapatos/paginas/contenedores.dart';
import 'package:flutter/material.dart';

//clase que retorna el metodo de la clase Contenedores hacia inicio.dart
class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Contenedores(),
    );
  }
}
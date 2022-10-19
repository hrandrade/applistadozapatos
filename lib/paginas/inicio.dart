import 'package:applistadozapatos/paginas/principal.dart';
import 'package:flutter/material.dart';

//clase que retorna el metodo de la clase Principal hacia main.dart
class AppListadoZapatos extends StatelessWidget {
  const AppListadoZapatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
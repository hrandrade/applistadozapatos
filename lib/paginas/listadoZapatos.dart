import 'dart:ffi';

import 'package:applistadozapatos/main.dart';
import 'package:applistadozapatos/paginas/detalle.dart';
import 'package:applistadozapatos/temas/colores.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListZapatos extends StatefulWidget {
  const ListZapatos({Key? key}) : super(key: key);

  @override
  State<ListZapatos> createState() => _ListZapatosState();
}

class _ListZapatosState extends State<ListZapatos> {
  int menu_activo = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var countMujeres = 0;
    var countHombres = 0;
    var countNinos = 0;
    var countNinas = 0;
    return Scaffold(
      appBar: spotApp(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //PRIMER BLOQUE
            Padding(
              padding: const EdgeInsets.only(top: 0.1, left: 0.1, right: 0.1),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("categorias")
                      .where('nomcategoria', isEqualTo: "Hombres")
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Row(
                              children: List.generate(
                                  streamSnapshot.data!.docs.length, (index) {
                            final DocumentSnapshot documentSnapshotCategoria =
                                streamSnapshot.data!.docs[index];
                            return Container(
                              height: 60,
                              width: size.width - 0.5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 9, left: 10, right: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 250),
                                      child: Text(
                                        documentSnapshotCategoria[
                                            'nomcategoria'],
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 145),
                                      child: Text(
                                        "#" +
                                            countHombres.toString() +
                                            " Productos Encontrados",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                              ),
                            );
                          })),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("productos")
                      .where('codcategoria', isEqualTo: 1)
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      countHombres = streamSnapshot.data!.docs.length;
                      return Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: List.generate(
                                  streamSnapshot.data!.docs.length, (index) {
                                final DocumentSnapshot documentSnapshot =
                                    streamSnapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetaProducto(
                                                  nombre: documentSnapshot['nomproducto'].toString(),
                                                  descripcion: documentSnapshot['descripcion'].toString(),
                                                  tallas: documentSnapshot['tallas'].toString(),
                                                  precio: documentSnapshot['precio'].toString(),
                                                  color: documentSnapshot['color'].toString(),
                                                  stock: documentSnapshot['stock'].toString(),
                                                  marca: documentSnapshot['marca'].toString(),
                                                  img2: documentSnapshot['img2'].toString(),
                                                  img3: documentSnapshot['img3'].toString(),
                                                  img1: documentSnapshot['img1'],
                                                  idprod: documentSnapshot['codproducto'])));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 160,
                                          height: 125,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      documentSnapshot['img1']),
                                                  fit: BoxFit.cover),
                                              color: Colors.black,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  spreadRadius: 0.2,
                                                  blurRadius: 0.1,
                                                  offset: Offset(-1,1), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            documentSnapshot['nomproducto'],
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "\$"+documentSnapshot['precio']
                                                    .toString(),
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            SizedBox(height: 25,),
            //SEGUNDO BLOQUE
            Padding(
              padding: const EdgeInsets.only(top: 0.1, left: 0.1, right: 0.1),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("categorias")
                      .where('codcategoria', isEqualTo: 2)
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Row(
                              children: List.generate(
                                  streamSnapshot.data!.docs.length, (index) {
                            final DocumentSnapshot documentSnapshotCategoria =
                                streamSnapshot.data!.docs[index];
                            return Container(
                              height: 60,
                              width: size.width - 0.5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 9, left: 10, right: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 250),
                                      child: Text(
                                        documentSnapshotCategoria[
                                            'nomcategoria'],
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 145),
                                      child: Text(
                                        "#" +
                                            countMujeres.toString() +
                                            " Productos Encontrados",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                              ),
                            );
                          })),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("productos")
                      .where('codcategoria', isEqualTo: 2)
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      countMujeres = streamSnapshot.data!.docs.length;
                      return Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: List.generate(
                                  streamSnapshot.data!.docs.length, (index) {
                                final DocumentSnapshot documentSnapshot =
                                    streamSnapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetaProducto(
                                                  nombre: documentSnapshot['nomproducto'].toString(),
                                                  descripcion: documentSnapshot['descripcion'].toString(),
                                                  tallas: documentSnapshot['tallas'].toString(),
                                                  precio: documentSnapshot['precio'].toString(),
                                                  color: documentSnapshot['color'].toString(),
                                                  stock: documentSnapshot['stock'].toString(),
                                                  marca: documentSnapshot['marca'].toString(),
                                                  img2: documentSnapshot['img2'].toString(),
                                                  img3: documentSnapshot['img3'].toString(),
                                                  img1: documentSnapshot['img1'],
                                                  idprod: documentSnapshot['codproducto'])));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 160,
                                          height: 125,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      documentSnapshot['img1']),
                                                  fit: BoxFit.cover),
                                              color: Colors.black,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  spreadRadius: 0.2,
                                                  blurRadius: 0.1,
                                                  offset: Offset(-1,1), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            documentSnapshot['nomproducto'],
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "\$"+documentSnapshot['precio']
                                                    .toString(),
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            SizedBox(height: 25,),
            //TERCER BLOQUE
            Padding(
              padding: const EdgeInsets.only(top: 0.1, left: 0.1, right: 0.1),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("categorias")
                      .where('nomcategoria', isEqualTo: "Niños")
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Row(
                              children: List.generate(
                                  streamSnapshot.data!.docs.length, (index) {
                            final DocumentSnapshot documentSnapshotCategoria =
                                streamSnapshot.data!.docs[index];
                            return Container(
                              height: 60,
                              width: size.width - 0.5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 9, left: 10, right: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 250),
                                      child: Text(
                                        documentSnapshotCategoria[
                                            'nomcategoria'],
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 145),
                                      child: Text(
                                        "#" +
                                            countNinos.toString() +
                                            " Productos Encontrados",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                              ),
                            );
                          })),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("productos")
                      .where('codcategoria', isEqualTo: 3)
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      countNinos = streamSnapshot.data!.docs.length;
                      return Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: List.generate(
                                  streamSnapshot.data!.docs.length, (index) {
                                final DocumentSnapshot documentSnapshot =
                                    streamSnapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetaProducto(
                                                  nombre: documentSnapshot['nomproducto'].toString(),
                                                  descripcion: documentSnapshot['descripcion'].toString(),
                                                  tallas: documentSnapshot['tallas'].toString(),
                                                  precio: documentSnapshot['precio'].toString(),
                                                  color: documentSnapshot['color'].toString(),
                                                  stock: documentSnapshot['stock'].toString(),
                                                  marca: documentSnapshot['marca'].toString(),
                                                  img2: documentSnapshot['img2'].toString(),
                                                  img3: documentSnapshot['img3'].toString(),
                                                  img1: documentSnapshot['img1'],
                                                  idprod: documentSnapshot['codproducto'])));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 160,
                                          height: 125,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      documentSnapshot['img1']),
                                                  fit: BoxFit.cover),
                                              color: Colors.black,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  spreadRadius: 0.2,
                                                  blurRadius: 0.1,
                                                  offset: Offset(-1,1), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            documentSnapshot['nomproducto'],
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "\$"+documentSnapshot['precio']
                                                    .toString(),
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            SizedBox(height: 25,),
            //CUARTO BLOQUE
            Padding(
              padding: const EdgeInsets.only(top: 0.1, left: 0.1, right: 0.1),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("categorias")
                      .where('nomcategoria', isEqualTo: "Niñas")
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Row(
                              children: List.generate(
                                  streamSnapshot.data!.docs.length, (index) {
                            final DocumentSnapshot documentSnapshotCategoria =
                                streamSnapshot.data!.docs[index];
                            return Container(
                              height: 60,
                              width: size.width - 0.5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 9, left: 10, right: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 250),
                                      child: Text(
                                        documentSnapshotCategoria[
                                            'nomcategoria'],
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 145),
                                      child: Text(
                                        "#" +
                                            countNinas.toString() +
                                            " Productos Encontrados",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                              ),
                            );
                          })),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("productos")
                      .where('codcategoria', isEqualTo: 4)
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      countNinas = streamSnapshot.data!.docs.length;
                      return Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: List.generate(
                                  streamSnapshot.data!.docs.length, (index) {
                                final DocumentSnapshot documentSnapshot =
                                    streamSnapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetaProducto(
                                                  nombre: documentSnapshot['nomproducto'].toString(),
                                                  descripcion: documentSnapshot['descripcion'].toString(),
                                                  tallas: documentSnapshot['tallas'].toString(),
                                                  precio: documentSnapshot['precio'].toString(),
                                                  color: documentSnapshot['color'].toString(),
                                                  stock: documentSnapshot['stock'].toString(),
                                                  marca: documentSnapshot['marca'].toString(),
                                                  img2: documentSnapshot['img2'].toString(),
                                                  img3: documentSnapshot['img3'].toString(),
                                                  img1: documentSnapshot['img1'],
                                                  idprod: documentSnapshot['codproducto'])));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 160,
                                          height: 125,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      documentSnapshot['img1']),
                                                  fit: BoxFit.cover),
                                              color: Colors.black,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  spreadRadius: 0.2,
                                                  blurRadius: 0.1,
                                                  offset: Offset(-1,1), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            documentSnapshot['nomproducto'],
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            "\$"+documentSnapshot['precio']
                                                    .toString(),
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
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
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "LISTADO DE ZAPATERIA",
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
}

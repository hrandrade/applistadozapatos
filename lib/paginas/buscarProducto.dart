import 'package:applistadozapatos/paginas/detalle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class BuscarProducto extends StatefulWidget {
  const BuscarProducto({Key? key}) : super(key: key);

  @override
  State<BuscarProducto> createState() => _BuscarProductoState();
}

class _BuscarProductoState extends State<BuscarProducto> {
  String productoBuscar = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 10,
            title: Container(
              width: 300,
              height: 37,
              decoration: BoxDecoration(color: Colors.white),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                    fillColor: Colors.black,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: 'Buscar Producto',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.black54)),
                onChanged: (val) {
                  setState(() {
                    productoBuscar = val;
                  });
                },
              ),
            )),
        body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection("productos").snapshots(),
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;

                      if (productoBuscar.isEmpty) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              data['marca'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data['nomproducto'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                FeatherIcons.chevronRight,
                                color: Colors.black54,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetaProducto(
                                                  nombre: data['nomproducto'].toString(),
                                                  descripcion: data['descripcion'].toString(),
                                                  tallas: data['tallas'].toString(),
                                                  precio: data['precio'].toString(),
                                                  color: data['color'].toString(),
                                                  stock: data['stock'].toString(),
                                                  marca: data['marca'].toString(),
                                                  img2: data['img2'].toString(),
                                                  img3: data['img3'].toString(),
                                                  img1: data['img1'],
                                                  idprod: data['codproducto'])));
                              },
                            ),
                            leading: Container(
                              width: 55.0,
                              height: 53.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(data['img1']),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.9,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      if (data['marca']
                          .toString()
                          .toLowerCase()
                          .startsWith(productoBuscar.toLowerCase())) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              data['marca'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data['nomproducto'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                FeatherIcons.chevronRight,
                                color: Colors.black54,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetaProducto(
                                                  nombre: data['nomproducto'].toString(),
                                                  descripcion: data['descripcion'].toString(),
                                                  tallas: data['tallas'].toString(),
                                                  precio: data['precio'].toString(),
                                                  color: data['color'].toString(),
                                                  stock: data['stock'].toString(),
                                                  marca: data['marca'].toString(),
                                                  img2: data['img2'].toString(),
                                                  img3: data['img3'].toString(),
                                                  img1: data['img1'],
                                                  idprod: data['codproducto'])));
                              },
                            ),
                            leading: Container(
                              width: 55.0,
                              height: 53.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(data['img1']),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.9,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      if (data['nomproducto']
                          .toString()
                          .toLowerCase()
                          .startsWith(productoBuscar.toLowerCase())) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              data['marca'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data['nomproducto'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                FeatherIcons.chevronRight,
                                color: Colors.black54,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetaProducto(
                                                  nombre: data['nomproducto'].toString(),
                                                  descripcion: data['descripcion'].toString(),
                                                  tallas: data['tallas'].toString(),
                                                  precio: data['precio'].toString(),
                                                  color: data['color'].toString(),
                                                  stock: data['stock'].toString(),
                                                  marca: data['marca'].toString(),
                                                  img2: data['img2'].toString(),
                                                  img3: data['img3'].toString(),
                                                  img1: data['img1'],
                                                  idprod: data['codproducto'])));
                              },
                            ),
                            leading: Container(
                              width: 55.0,
                              height: 53.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(data['img1']),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.9,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return Container();
                    });
          },
        ));
  }
}

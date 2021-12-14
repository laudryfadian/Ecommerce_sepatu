import 'dart:convert';

import 'package:bakul_sepatu/models/Produk.dart';
import 'package:bakul_sepatu/network/link.dart';
import 'package:bakul_sepatu/pages/produk/produkDetail.dart';
import 'package:bakul_sepatu/widgets/card_produk.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Produk extends StatefulWidget {
  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  late List<Produks> listProduk;

  Future<List<Produks>> _fetchData() async {
    try {
      var r = await get(Uri.parse(BaseAuth.domain + 'produk'),
          headers: <String, String>{'authorization': BaseAuth.basicAuth});
      if (r.statusCode == 200) {
        var jsonItems =
            json.decode(r.body)['data'].cast<Map<String, dynamic>>();

        listProduk = jsonItems.map<Produks>((json) {
          return Produks.fromJson(json);
        }).toList();
      }
    } catch (e) {
      print(e);
    }
    return listProduk;
  }

  Future<Null> _refresh() {
    return _fetchData().then((_listProduk) {
      setState(() => listProduk = _listProduk);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: FutureBuilder<List<Produks>>(
            future: _fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                listProduk = snapshot.data!;
                return Container(
                  // child: ListView.builder(
                  //     itemCount: listProduk.length,
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       var _data = listProduk[index];
                  //       return InkWell(
                  //           onTap: () {},
                  //           child: CardProduk(
                  //             produk: _data,
                  //           ));
                  //     }),
                  height: double.infinity,
                  child: GridView.count(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 50.0),
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 40,
                    children: snapshot.data!
                        .map((_data) => GestureDetector(
                              child: GridTile(
                                child: CardProduk(produk: _data),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProdukDetail(
                                      produk: _data,
                                    ),
                                  ),
                                );
                              },
                            ))
                        .toList(),
                  ),
                  // padding: EdgeInsets.only(bottom: 10.0),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

import 'package:bakul_sepatu/models/Produk.dart';
import 'package:bakul_sepatu/pages/produk/transaksi2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdukDetail extends StatelessWidget {
  final Produks produk;
  ProdukDetail({required this.produk});

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();
    var id = produk.id;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(produk.nama),
        centerTitle: true,
      ),
      body: CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 350.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(produk.urlGambar),
                        fit: BoxFit.cover)),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        produk.nama,
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp. " + produk.hargaJual,
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 20.0),
                          ),
                          Text('Stok ' + produk.stok)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Size ' + produk.size,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Deskripsi',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(produk.keterangan),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blue.shade800,
        child: ListTile(
          title: Text(
            'BUY',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Jumlah beli'),
                  content: TextField(
                    controller: _textFieldController,
                    keyboardType: TextInputType.number,
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('CANCEL'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        print(_textFieldController.text);
                        print(produk.id);
                        var jumlah = int.parse(_textFieldController.text);
                        var harga = int.parse(produk.hargaJual);
                        var total = jumlah * harga;
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Transaksi2(
                                    idProduk: id,
                                    stok: _textFieldController.text,
                                    nama: produk.nama,
                                    size: produk.size,
                                    total: total,
                                  )),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

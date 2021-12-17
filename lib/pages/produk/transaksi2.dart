import 'dart:convert';

import 'package:bakul_sepatu/network/link.dart';
import 'package:bakul_sepatu/pages/produk/bayarScreen.dart';
import 'package:bakul_sepatu/pages/produk/errorScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Transaksi2 extends StatefulWidget {
  final String idProduk;
  final String stok;
  final String nama;
  final String size;
  final int total;
  const Transaksi2(
      {Key? key,
      required this.idProduk,
      required this.stok,
      required this.nama,
      required this.size,
      required this.total})
      : super(key: key);

  @override
  _Transaksi2State createState() => _Transaksi2State();
}

class _Transaksi2State extends State<Transaksi2> {
  TextEditingController alamatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String totalBayar = widget.total.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // color: Colors.red,
              child: Text(
                'Detail Transaksi',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                      width: 130,
                      // color: Colors.red,
                      child: Text(
                        'Nama Produk',
                        style: TextStyle(fontSize: 16),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 16),
                      )),
                  Container(
                    child: Text(
                      widget.nama,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                      width: 130,
                      // color: Colors.red,
                      child: Text(
                        'Size',
                        style: TextStyle(fontSize: 16),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 16),
                      )),
                  Container(
                    child: Text(
                      widget.size,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                      width: 130,
                      // color: Colors.red,
                      child: Text(
                        'Jumlah Beli',
                        style: TextStyle(fontSize: 16),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 16),
                      )),
                  Container(
                    child: Text(
                      widget.stok,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                      width: 130,
                      // color: Colors.red,
                      child: Text(
                        'Total Bayar',
                        style: TextStyle(fontSize: 16),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 16),
                      )),
                  Container(
                    child: Text(
                      'Rp. ' + totalBayar,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextField(
                controller: alamatController,
                maxLines: 8,
                decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan Alamat pengiriman'),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.green.shade800,
        child: ListTile(
          title: Text(
            'BAYAR',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onTap: () {
            bayar(alamatController.text, totalBayar);
          },
        ),
      ),
    );
  }

  void bayar(alamat, totalBayar) async {
    try {
      if (alamatController.text == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Alamat tidak boleh kosong')));
        return;
      }
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? idUser = pref.getString("login");
      var response = await http.post(Uri.parse(BaseAuth.domain + 'penjualan'),
          headers: <String, String>{'authorization': BaseAuth.basicAuth},
          body: ({
            "user": idUser,
            "produk": widget.idProduk,
            "jumlah": widget.stok,
            "status": "Menunggu Pembayaran",
            "alamat": alamat
          }));
      print('alamat tujuan = ' + alamat);
      final body = jsonDecode(response.body);
      print(body);
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BayarScreen(
                    total: totalBayar,
                  )),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ErrorScreen()),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}

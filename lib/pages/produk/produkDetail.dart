import 'package:bakul_sepatu/models/Produk.dart';
import 'package:flutter/material.dart';

class ProdukDetail extends StatelessWidget {
  final Produks produk;
  ProdukDetail({required this.produk});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.ngopibareng.id/images/uploads/2021/2021-05-26/8-rekomendasi-sepatu-lokal-maksimalkan-gayamu--01'),
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
                    child: Text(
                      "Rp. " + produk.hargaJual,
                      style:
                          TextStyle(color: Colors.blueAccent, fontSize: 20.0),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

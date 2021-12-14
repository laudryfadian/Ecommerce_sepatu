import 'package:bakul_sepatu/models/Produk.dart';
import 'package:flutter/material.dart';

class CardProduk extends StatelessWidget {
  final Produks produk;
  CardProduk({required this.produk});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Image.network(
            'https://s3.bukalapak.com/bukalapak-kontenz-production/content_attachments/67893/w-740/92802586_225540215456856_7684868667231593088_n.jpg',
            height: 180.0,
            fit: BoxFit.fitHeight,
          ),
          Container(width: double.infinity, child: Text(produk.nama)),
          Container(
            width: double.infinity,
            height: 23.0,
            // padding: EdgeInsets.only(top: 5.0),
            child: Text(
              "Rp." + produk.hargaJual,
              style: TextStyle(fontSize: 18.0, color: Colors.redAccent),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}

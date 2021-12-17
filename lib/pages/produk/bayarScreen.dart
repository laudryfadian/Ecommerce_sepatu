import 'package:bakul_sepatu/nav.dart';
import 'package:flutter/material.dart';

class BayarScreen extends StatelessWidget {
  final String total;
  const BayarScreen({Key? key, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Transaksi Sukses!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Segera selesaikan pembayaran',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'ke rekening Mandiri 21387128312783',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Transaksi akan di proses oleh admin ketika',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('sudah berhasil transfer',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Sebesar = Rp. ' + total,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Nav()),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                child: Text(
                  "Kembali ke home",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ))),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Tejadi Kesalahan Bosku',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Text('Mohon ulangi lagi transaksi')
        ],
      ),
    );
  }
}

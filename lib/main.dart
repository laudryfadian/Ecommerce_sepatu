import 'package:bakul_sepatu/auth/login.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bakul Sepatu',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

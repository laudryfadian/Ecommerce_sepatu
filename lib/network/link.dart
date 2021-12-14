import 'dart:convert';

class BaseAuth {
  static String basicAuth =
      'Basic ' + base64Encode(utf8.encode('admin:admin123123'));
  static String domain = 'https://kelola-produk.herokuapp.com/';
}

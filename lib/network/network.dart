import 'dart:convert';
import 'package:http/http.dart';

class Api {
  static Future getAuth(url) async {
    String username = 'admin';
    String password = 'admin123123';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    Response r = await get(
        Uri.parse('https://kelola-produk.herokuapp.com/' + url),
        headers: <String, String>{'authorization': basicAuth});
    print(r.statusCode);
    print(r.body);
  }
}

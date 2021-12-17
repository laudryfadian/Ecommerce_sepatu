import 'dart:convert';

import 'package:bakul_sepatu/auth/register.dart';
import 'package:bakul_sepatu/nav.dart';
import 'package:bakul_sepatu/network/link.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("login");
    if (val != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Nav()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Sign In",
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 30.0),
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              "Email",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              margin: EdgeInsets.only(top: 10.0),
              child: TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  autocorrect: true,
                  decoration: InputDecoration(
                      hintText: "Masukkan email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white60),
                      filled: true,
                      fillColor: Colors.blue.shade400,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.blueAccent, width: 2.0))))),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 30.0),
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              "Password",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              margin: EdgeInsets.only(top: 10.0),
              child: TextField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  autocorrect: false,
                  obscureText: true,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                      hintText: "Masukkan password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white60),
                      filled: true,
                      fillColor: Colors.blue.shade400,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.blueAccent, width: 2.0))))),
          Container(
            width: double.infinity,
            height: 40.0,
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            margin: EdgeInsets.only(top: 50.0),
            child: ElevatedButton(
                child:
                    Text("Login".toUpperCase(), style: TextStyle(fontSize: 14)),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blueAccent)))),
                onPressed: () {
                  login();
                }),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum Punya Akun ? ",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  void login() async {
    try {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        var response = await http.post(
            Uri.parse(BaseAuth.domain + 'auth/user/login'),
            headers: <String, String>{'authorization': BaseAuth.basicAuth},
            body: ({
              "email": emailController.text,
              "password": passwordController.text
            }));
        final body = jsonDecode(response.body);
        final bodyy = jsonDecode(response.body)['data'];
        print(body);
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(body['message'])));

          getId(bodyy['_id']);
          getNama(bodyy['nama']);
          getEmail(bodyy['email']);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(body['message'])));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email & Password masih kosong")));
      }
    } catch (e) {
      print(e);
    }
  }

  void getId(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", id);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Nav()),
      (Route<dynamic> route) => false,
    );
  }

  void getNama(String nama) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("nama", nama);
  }

  void getEmail(String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("email", email);
  }
}

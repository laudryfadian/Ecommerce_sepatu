import 'package:bakul_sepatu/auth/register.dart';
import 'package:bakul_sepatu/nav.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Nav()),
                  );
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
}

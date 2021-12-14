import 'dart:convert';

import 'package:bakul_sepatu/auth/login.dart';
import 'package:bakul_sepatu/network/link.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dropdownValue = 'L';
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController lahirController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.blue.shade200,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 30.0),
                      margin: EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Nama Lengkap",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        margin: EdgeInsets.only(top: 10.0),
                        child: TextField(
                            controller: namaController,
                            style: TextStyle(color: Colors.white),
                            autocorrect: true,
                            decoration: InputDecoration(
                                hintText: "Masukkan nama lengkap",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                filled: true,
                                fillColor: Colors.blue.shade400,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                        width: 2.0))))),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                        width: 2.0))))),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 30.0),
                      margin: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Tanggal Lahir",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        margin: EdgeInsets.only(top: 10.0),
                        child: TextField(
                            controller: lahirController,
                            style: TextStyle(color: Colors.white),
                            autocorrect: true,
                            decoration: InputDecoration(
                                hintText: "Masukkan Tanggal Lahir",
                                prefixIcon: Icon(
                                  Icons.date_range_sharp,
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                filled: true,
                                fillColor: Colors.blue.shade400,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                        width: 2.0))))),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 30.0),
                      margin: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Nomor Hp",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        margin: EdgeInsets.only(top: 10.0),
                        child: TextField(
                            controller: noHpController,
                            style: TextStyle(color: Colors.white),
                            autocorrect: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Masukkan nomor handphone",
                                prefixIcon: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(color: Colors.white60),
                                filled: true,
                                fillColor: Colors.blue.shade400,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                        width: 2.0))))),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 30.0),
                      margin: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Jenis Kelamin",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade400,
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          iconSize: 20,
                          elevation: 12,
                          value: dropdownValue,
                          style: const TextStyle(color: Colors.white),
                          underline: Container(height: 0),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['L', 'P'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                        width: 2.0))))),
                    Container(
                      width: double.infinity,
                      height: 40.0,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      margin: EdgeInsets.only(top: 50.0),
                      child: ElevatedButton(
                          child: Text("Register".toUpperCase(),
                              style: TextStyle(fontSize: 14)),
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.blueAccent),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.blueAccent)))),
                          onPressed: () {
                            register();
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sudah Punya Akun ? ",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Login",
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void register() async {
    try {
      if (namaController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          lahirController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        var response = await http.post(Uri.parse(BaseAuth.domain + 'user'),
            headers: <String, String>{'authorization': BaseAuth.basicAuth},
            body: ({
              "nama": namaController.text,
              "email": emailController.text,
              "password": passwordController.text,
              "ttl": lahirController.text,
              "jk": dropdownValue,
              "nohp": noHpController.text
            }));
        final body = jsonDecode(response.body);
        print(body);
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(body['message'])));
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false,
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(body['message'])));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Field masih kosong")));
      }
    } catch (e) {
      print(e);
    }
  }
}

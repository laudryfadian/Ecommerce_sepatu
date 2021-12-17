import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                  // controller: passwordController,
                  style: TextStyle(color: Colors.black),
                  autocorrect: false,
                  obscureText: true,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                      hintText: "Masukkan password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      hintStyle: TextStyle(color: Colors.black))),
            ),
            Container(
              // padding: EdgeInsets.only(top: 20),
              child: TextField(
                  // controller: passwordController,
                  style: TextStyle(color: Colors.black),
                  autocorrect: false,
                  obscureText: true,
                  enableSuggestions: false,
                  decoration: InputDecoration(
                      hintText: "Masukkan password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      hintStyle: TextStyle(color: Colors.black))),
            ),
            ListTile(
              title: Text('Cut'),
              leading: Icon(Icons.content_cut),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text('Move'),
              leading: Icon(Icons.folder_open),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text('Delete'),
              leading: Icon(Icons.delete),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    ));
  }
}

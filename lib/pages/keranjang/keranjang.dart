import 'dart:convert';

import 'package:bakul_sepatu/models/user.dart';
import 'package:bakul_sepatu/network/link.dart';
import 'package:bakul_sepatu/pages/keranjang/detailhistory.dart';
import 'package:bakul_sepatu/widgets/card_history.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  late List<History> listHistory;

  Future<List<History>> _fetchData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? val = pref.getString("login");
      var r = await get(
          Uri.parse(BaseAuth.domain + 'penjualan/history?user=$val'),
          headers: <String, String>{'authorization': BaseAuth.basicAuth});
      if (r.statusCode == 200) {
        var jsonItems =
            json.decode(r.body)['data'].cast<Map<String, dynamic>>();

        listHistory = jsonItems.map<History>((json) {
          return History.fromJson(json);
        }).toList();
      }
    } catch (e) {
      print(e);
    }
    return listHistory;
  }

  Future<Null> _refresh() {
    return _fetchData().then((_listHistory) {
      setState(() => listHistory = _listHistory);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RefreshIndicator(
      onRefresh: _refresh,
      child: FutureBuilder<List<History>>(
        future: _fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List<History>> snapshot) {
          if (snapshot.hasData) {
            listHistory = snapshot.data!;
            return Container(
              height: double.infinity,
              margin: EdgeInsets.only(bottom: 50.0),
              child: ListView.builder(
                itemCount: listHistory.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var _data = listHistory[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailHistory(history: _data)),
                      );
                    },
                    child: CardHistory(
                      history: _data,
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red.shade900,
              ),
            );
          }
        },
      ),
    ));
  }
}

import 'package:bakul_sepatu/constants.dart';
import 'package:bakul_sepatu/models/user.dart';
import 'package:bakul_sepatu/widgets/circle_button.dart';
import 'package:flutter/material.dart';

class DetailHistory extends StatelessWidget {
  final History history;
  const DetailHistory({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 2.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            SizedBox(
              height: 12.0,
            ),
            Hero(
                tag: history.tanggal,
                child: Container(
                  height: 220.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/free-vector/red-sneakers-blue-background-illustration_193606-45.jpg?size=626&ext=jpg'),
                          fit: BoxFit.fill)),
                )),
            SizedBox(
              height: 10.0,
            ),
            Text(
              history.barang.nama,
              style: kTitleCard.copyWith(fontSize: 28.0),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rp. ' + history.totalBayar.toString(),
                  style: kActiveTabStyle,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5.0,
                      backgroundColor: history.status == "Sukses"
                          ? Colors.greenAccent
                          : Colors.redAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      history.status == "Menunggu Pembayaran"
                          ? "Validasi Admin"
                          : "Sukses",
                      style: TextStyle(
                          color: history.status == "Sukses"
                              ? Colors.green
                              : Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              history.alamat,
              style: descriptionStyle,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

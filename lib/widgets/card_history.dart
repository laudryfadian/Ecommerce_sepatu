import 'package:bakul_sepatu/constants.dart';
import 'package:bakul_sepatu/models/user.dart';
import 'package:flutter/material.dart';

class CardHistory extends StatelessWidget {
  final History history;
  const CardHistory({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: kGrey3, width: 1.0)),
      child: Row(
        children: [
          Container(
            width: 90.0,
            height: 135.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/free-vector/red-sneakers-blue-background-illustration_193606-45.jpg?size=626&ext=jpg'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  history.barang.nama,
                  style: kTitleCard,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  history.status == "Menunggu Pembayaran"
                      ? "Status : Validasi Pembayaran Oleh Admin"
                      : "Status : Pesanan Sukses",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: kDetailContent,
                ),
                SizedBox(
                  height: 10.0,
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
                      'Rp. ' + history.totalBayar.toString(),
                      style: kDetailContent,
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

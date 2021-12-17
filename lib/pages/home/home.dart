import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nama = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      nama = pref.getString("nama")!;
      email = pref.getString("email")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      height: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50.0,
              child: Row(
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Alesso_profile.png/467px-Alesso_profile.png'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          nama,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                        Text(
                          'Selamat Datang',
                          style: TextStyle(fontSize: 15.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 206.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://awsimages.detik.net.id/visual/2021/03/30/satan-soes-mschf_169.jpeg?w=650'),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Super Flash Sale',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '60% Off',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Center(
                                child: Text(
                                  '19',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Text(
                                ':',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0),
                              ),
                            ),
                            Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Center(
                                child: Text(
                                  '00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 206.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://blenderartists.org/uploads/default/original/4X/d/a/4/da413704a6ea18dc7946885b86d8ced2088e4ada.png'),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Recomended',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Product',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Text(
                            'We recommended the best for you',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontStyle: FontStyle.italic),
                          ))
                    ],
                  ),
                )),
            // Container(
            //   height: 300.0,
            //   width: double.infinity,
            //   color: Colors.red,
            // ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}

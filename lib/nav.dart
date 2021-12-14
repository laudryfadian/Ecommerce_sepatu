import 'package:bakul_sepatu/pages/akun/akun.dart';
import 'package:bakul_sepatu/pages/home/home.dart';
import 'package:bakul_sepatu/pages/keranjang/keranjang.dart';
import 'package:bakul_sepatu/pages/produk/produk.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  // List<Widget> _buildScreens() {
  //   return [Home(), Produk(), Keranjang(), Akun()];
  // }
  List<Widget> _widgetOptions = <Widget>[Home(), Produk(), Keranjang(), Akun()];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.home),
  //       title: ("Home"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.cube_box),
  //       title: ("Produk"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.cart),
  //       title: ("Keranjang"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.person_crop_circle),
  //       title: ("Akun"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Bakul Sepatu'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blueAccent,
        backgroundColor: Colors.red.withOpacity(0),
        buttonBackgroundColor: Colors.blueAccent,
        height: 50,
        items: const <Widget>[
          Icon(CupertinoIcons.home, color: Colors.white),
          Icon(CupertinoIcons.cube_box, color: Colors.white),
          Icon(CupertinoIcons.cart, color: Colors.white),
          Icon(CupertinoIcons.person_crop_circle, color: Colors.white)
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        index: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}

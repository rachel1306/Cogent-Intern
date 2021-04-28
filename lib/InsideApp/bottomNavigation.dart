import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/InsideApp/InnerHome.dart';
import 'package:cogent_ecomm_app/InsideApp/wallet.dart';
import 'package:cogent_ecomm_app/InsideApp/profile.dart';
import 'package:cogent_ecomm_app/InsideApp/myOrders.dart';
import 'package:cogent_ecomm_app/InsideApp/search.dart';
class bottomNav extends StatefulWidget {
  @override
  _bottomNavState createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  final tabs=[
    home(),
    wallet(),
    search(),
    myOrder(),
    profile(),
  ];
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/bottomNav/bars.png')),
            label: 'Wallet'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/bottomNav/myOrders.png')),
            label: 'Orders'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/bottomNav/profile.png')),
            label: 'Profile'
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;

          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
      ),
    );
  }
}

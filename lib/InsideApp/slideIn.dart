import 'package:cogent_ecomm_app/InsideApp/InnerHome.dart';
import 'package:flutter/material.dart';

class slideIn extends StatefulWidget {
  @override
  _slideInState createState() => _slideInState();
}

class _slideInState extends State<slideIn> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: /*Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50)
                ),
                color: Color(0xffBCE0FD),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40,left: 30),
                    child: Container(
                      child: Icon(Icons.person,color: Colors.white,),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius. all(Radius. circular(100))
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 70,bottom: 5),
                          //padding: EdgeInsets.all(MediaQuery.of(context).size.width/20),
                          child: Text('Jennifer',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                        ),
                        Text('San Fransisco, CA')
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25,left: 40),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ImageIcon(AssetImage('assets/slideIn/home.png'))
                ),
                Text('HOME'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25,left: 40),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ImageIcon(AssetImage('assets/slideIn/explore.png'))
                ),
                Text('EXPLORE'),
              ],
            ),
          ),
        Padding(
          padding: EdgeInsets.only(bottom: 25,left: 40),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.notifications),
              ),
              Text('NOTIFICATION'),
            ],
          ),
        ),
          Padding(
            padding: EdgeInsets.only(bottom: 25,left: 40),
            child: Row(
               children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
                Text('CART'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25,left: 40),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.location_on),
                ),
                Text('PRIVACY POLICY'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25,left: 40),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.settings_sharp),
                ),
                Text('SETTINGS'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25,left: 40),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.search),
                ),
                Text('SEARCH'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25,left: 84),
            child: Text('ORDER TRACKING'),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25,left: 84),
            child: Text('CHANGE PASSWORD'),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25,left: 84,),
            child: Text('LOGOUT'),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25,left: 84,),
            child: Text('FEEDBACK'),
          ),
          Spacer(),
          Row(
            children: [

            ],
          )
        ],
      ),*/
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50)
              ),
              color: Color(0xffBCE0FD),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Container(
                      child: Icon(Icons.person,color: Colors.white,),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(color: Colors.blue,
                          borderRadius: BorderRadius. all(Radius. circular(100))
                        ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 35,bottom: 5),
    //padding: EdgeInsets.all(MediaQuery.of(context).size.width/20),
                           child: Text('Jennifer',
                             style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                               fontSize: 20,
                             ),),
                        ),
                        Text('San Fransisco, CA')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              children: [
                ListTile(
                  title: Text('HOME'),
                  leading: ImageIcon(AssetImage('assets/slideIn/home.png')),
                ),
                ListTile(
                  title: Text('EXPLORE'),
                  leading: ImageIcon(AssetImage('assets/slideIn/explore.png')),
                ),
                ListTile(
                  title: Text('WALLET'),
                  leading: ImageIcon(AssetImage('assets/slideIn/wallet.png')),
                ),
                ListTile(
                  title: Text('NOTIFICATIONS'),
                  leading: Icon(Icons.notifications),
                ),
                ListTile(
                  title: Text('YOUR ORDERS'),
                  leading: ImageIcon(AssetImage('assets/slideIn/orders.png')),
                ),
                ListTile(
                  title: Text('CART'),
                  leading: Icon(Icons.shopping_cart_outlined),
                ),
                ListTile(
                  title: Text('PRIVACY POLICY'),
                  leading: Icon(Icons.location_on),
                ),
                ListTile(
                  title: Text('SETTINGS'),
                  leading: Icon(Icons.settings_sharp),
                ),
                ListTile(
                  title: Text('SEARCH'),
                  leading: Icon(Icons.search),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 85),
            child: Column(
              children: [
                ListTile(
                  title: Text('ORDER TRACKING'),
                ),
                ListTile(
                  title: Text('CHANGE PASSWORD'),
                ),
                ListTile(
                  title: Text('LOGOUT'),
                ),
                ListTile(
                  title: Text('FEEDBACK'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

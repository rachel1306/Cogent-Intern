import 'package:cogent_ecomm_app/InsideApp/InnerHome.dart';
import 'package:cogent_ecomm_app/InsideApp/SideNavbar/feedback.dart';
import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/InsideApp/SideNavbar/notification.dart';
import 'package:cogent_ecomm_app/InsideApp/SideNavbar/PrivacyPolicy.dart';
import 'package:cogent_ecomm_app/InsideApp/SideNavbar/settings.dart';
import 'package:cogent_ecomm_app/InsideApp/SideNavbar/logout.dart';
class slideIn extends StatefulWidget {
  @override
  _slideInState createState() => _slideInState();
}

class _slideInState extends State<slideIn> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
                  onTap: (){
                    Navigator.pop(context);
                  },
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
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => notification()));
                    //Navigator.popAndPushNamed(context,'/notifications');
                  },
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
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => privacyPolicy()));
                    //Navigator.popAndPushNamed(context, '/privacy');
                   // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => privacyPolicy()), ModalRoute.withName('/privacy'));
                  },
                ),
                ListTile(
                  title: Text('SETTINGS'),
                  leading: Icon(Icons.settings_sharp),
                  onTap: (){
                    Navigator.pop(context);
                 Navigator.pop(context, MaterialPageRoute(builder: (context) => Settings()));
                  //Navigator.popAndPushNamed(context,'/InsideApp/SideNavbar/settings');
                    //Navigator.of(context).popAndPushNamed("/settings");
                },
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
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => logOut()));
                    //Navigator.popAndPushNamed(context, '/privacy');
                    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => privacyPolicy()), ModalRoute.withName('/privacy'));
                  },
                ),
                ListTile(
                  title: Text('FEEDBACK'),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => feedback()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 80,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(AssetImage('assets/fb_logo.png'),size: 50,),
                ImageIcon(AssetImage('assets/instagram.png'),size: 50,),
                ImageIcon(AssetImage('assets/twitter_logo.png'),size: 50,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

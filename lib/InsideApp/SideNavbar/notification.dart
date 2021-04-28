import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',style: TextStyle(color: Colors.grey[600]),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Image(
                    alignment: Alignment.topLeft,
                    width: 70,
                    color: Color(0xff4D53F0),
                    image: AssetImage('assets/notification.png',),
    )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'
                      ' ut labore et dolore magna aliqua.',style: TextStyle(fontSize: 15),),
                )
              ],

            ),
          ),
        ],
      ),
    );
  }
}

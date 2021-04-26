import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/InsideApp/InnerHome.dart';
class firstSignupScreen extends StatefulWidget {
  @override
  _firstSignupScreenState createState() => _firstSignupScreenState();
}

class _firstSignupScreenState extends State<firstSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/firstScreen.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: 300,
                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt '
                    'ut labore et dolore magna aliqua. ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45,bottom: 15),
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color(0xffBCE0FD),
                        Color(0xff4D53F0),
                      ]
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.75)
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                  },
                  child: Text('Shop now',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                    ),),
                ),
              ),
            ),
            SizedBox(
              width: 290,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => resetPassword()));
                  },
                  child: new Text("skip now",
                    style: TextStyle(
                        fontSize: 15),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

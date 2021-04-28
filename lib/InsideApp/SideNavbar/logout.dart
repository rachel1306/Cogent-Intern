import 'package:cogent_ecomm_app/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/InsideApp/InnerHome.dart';
class logOut extends StatefulWidget {
  @override
  _logOutState createState() => _logOutState();
}

class _logOutState extends State<logOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Out',style: TextStyle(color: Colors.grey[600]),),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width/2,
                child:
                Text('Are you sure you want to logout? \n We cannot notify you of new matches if you do.' ,
                  textAlign: TextAlign.center,)),
            Padding(
              padding: EdgeInsets.only(top: 50,bottom: 20),
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
                  onPressed: null,
                  child: TextButton(
                    child: Text('Log Out',
                        style: TextStyle(
                        //fontSize: 20,
                        color: Colors.white,
                    ),),
                    onPressed: (){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => signIn()),ModalRoute.withName('')); }
                    ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Container(
                width: 300,
                height: 50,
                child: OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                      shadowColor: Colors.black,
                      elevation: 4,
                      backgroundColor: Colors.white
                  ),
                  child: TextButton(
                    child: Text('Cancel',style: TextStyle(color: Colors.black)),
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => home()),ModalRoute.withName(''));
                    },
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

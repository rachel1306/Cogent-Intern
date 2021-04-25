import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _email=TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text('Verification Code',
            style: TextStyle( color: Colors.grey[600]),),
        ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            child:
            Text('Enter the verification code we just sent you on your email address',
              textAlign: TextAlign.center,),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
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
                  Navigator.of(context).popUntil((route){
                    return route.settings.name == 'SignIn';
                  });
                },
                child: Text('Verify',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

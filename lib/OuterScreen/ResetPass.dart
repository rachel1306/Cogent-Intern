import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cogent_ecomm_app/OuterScreen/verification.dart';
class resetPassword extends StatefulWidget {
  @override
  _resetPasswordState createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  final _email=TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot password',
          style: TextStyle( color: Colors.grey[600]),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
              child:
              Text('Enter your mail address below to reset password',
                textAlign: TextAlign.center,),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
            controller: _email,
              decoration: InputDecoration(
                hintText: 'Email',
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
                  _auth.sendPasswordResetEmail(email: _email.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Verification()));
                },
                child: Text('Reset Password',
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

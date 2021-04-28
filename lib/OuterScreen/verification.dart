import 'package:cogent_ecomm_app/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_auth/email_auth.dart';
class Verification extends StatefulWidget {
  final String _email;
  const Verification(this._email);
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _otp=TextEditingController();

  void verifyOTP() async{
    bool _verified=false;
    var res=await EmailAuth.validate(receiverMail: widget._email, userOTP: _otp.text);
    setState(() {
      _verified=true;
    });
    if(res){
      _auth.sendPasswordResetEmail(email: widget._email);
      //Navigator.popUntil(context, ModalRoute.withName('/signIn'));
      print("otp verified");
    }
    else print("Not verified");
    if(_verified == true) Navigator.push(context, MaterialPageRoute(builder: (context) => signIn()));
      //Navigator.popUntil(context, ModalRoute.withName('/signIn'));
  }
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
              controller: _otp,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
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
                onPressed: () {
                  verifyOTP();
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

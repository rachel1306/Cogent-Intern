import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cogent_ecomm_app/InsideApp/InnerHome.dart';
class googleLogin extends StatefulWidget {
  @override
  _googleLoginState createState() => _googleLoginState();
}

class _googleLoginState extends State<googleLogin> {
  FirebaseAuth _auth=FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn=GoogleSignIn();
  Future signInWithGoogle() async{
    try{
      final GoogleSignInAccount _googleUser= await GoogleSignIn().signIn();
      if(_googleUser != null){
        final GoogleSignInAuthentication _gAuth=await _googleUser.authentication;
        final GoogleAuthCredential _gCredential= GoogleAuthProvider.credential(
          idToken: _gAuth.idToken,
          accessToken: _gAuth.accessToken,
        );
        User user= (await _auth.signInWithCredential(_gCredential)).user;
        Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
      }
    }
    catch(e){ print(e); }
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // background
        onPrimary: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),// foreground
      ),
      onPressed: () async{
        await signInWithGoogle();
      },
      child: Image(
        width: 50,
        height: 20,
        image: AssetImage('assets/google_logo.png',),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:cogent_ecomm_app/InsideApp/InnerHome.dart';

class fbLogin extends StatefulWidget {
  @override
  _fbLoginState createState() => _fbLoginState();
}

class _fbLoginState extends State<fbLogin> {
  FirebaseAuth _auth=FirebaseAuth.instance;
  FacebookLogin _fbLogin=FacebookLogin();
  bool isLogIn=false;
  User _user;
  Future handleFaceBLogin() async {
    FacebookLoginResult _result = await _fbLogin.logIn(['email']);
    switch (_result.status) {
      case FacebookLoginStatus.cancelledByUser:
        print('Cancelled by User');
        break;
      case FacebookLoginStatus.error:
        print('Error');
        break;
      case FacebookLoginStatus.loggedIn:
        await _loginwithFacebook(_result);
        break;
    }
  }
  Future _loginwithFacebook(FacebookLoginResult _result) async{
    FacebookAccessToken _accessToken= _result.accessToken;
    AuthCredential _credential=FacebookAuthProvider.credential(_accessToken.token);
    var a=await _auth.signInWithCredential(_credential);
    setState(() {
      isLogIn=true;
      _user=a.user;
    });
    if(isLogIn ==true ){
      Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
    }
  }
  Future signOutFB() async{
    await _auth.signOut().then((value){
      setState(() {
        _fbLogin.logOut();
        isLogIn=false;
      });
    });
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
      onPressed: () async {
        await handleFaceBLogin();
      },
      child: Image(
        image: AssetImage('assets/fb_logo.png',),
        color: Color(0xff4D53F0),
      ),
    );
  }
}

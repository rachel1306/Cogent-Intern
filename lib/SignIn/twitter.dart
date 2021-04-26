import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_twitter_login/flutter_twitter_login.dart';
class twitterLogin extends StatefulWidget {
  @override
  _twitterLoginState createState() => _twitterLoginState();
}

class _twitterLoginState extends State<twitterLogin> {
  /*FirebaseAuth _auth=FirebaseAuth.instance;
  bool isLogged=false;
  /*void signInWithTwitter(String token, String secret) async {
    final AuthCredential credential = TwitterAuthProvider.getCredential(
        authToken: token, authTokenSecret: secret);
    await _auth.signInWithCredential(credential);
  }*/
  Future<User> loginWithTwitter() async{
    var _tLogin=new TwitterLogin(
      consumerKey: 'w35I2GaFMbsqQRTaBbmFMIHdO',
      consumerSecret: 'jOR5yBDHjm0bGrBwPOQZphSb7P2cbwE2qIyJjnUgiZafGmEs2d',
    );
    final TwitterLoginResult _result=await _tLogin.authorize();
    switch(_result.status){
      case TwitterLoginStatus.loggedIn:
        var session=_result.session;
        print(session.username);
        /*User _user=await _auth.signInWithTwitter(
            _result.session.token, _result.session.secret
        );
          return _user;*/
        //_sendTokenAndSecretToServer(session.token, session.secret);
        break;
      case TwitterLoginStatus.cancelledByUser: //_showCancelMessage();
        return null;

        break;
      case TwitterLoginStatus.error: //_showErrorMessage(result.error);
        return null;
        break;
    }
  }
  void _logInTwitter(){
    _loginWithTwitter().then((response){
      if(response!=null){

      }
    });
  }
  void _signInWithTwitter(String token, String secret) async {
    final AuthCredential credential = TwitterAuthProvider.getCredential(
        authToken: token, authTokenSecret: secret);
    await _auth.signInWithCredential(credential);
  }
  void _login() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    String newMessage;
    if (result.status == TwitterLoginStatus.loggedIn) {
      _signInWithTwitter(result.session.token, result.session.secret);
    } else if (result.status == TwitterLoginStatus.cancelledByUser) {
      newMessage = 'Login cancelled by user.';
    } else {
      newMessage = result.errorMessage;
    }
    setState(() {
      isLogged=true;
    });
  }*/
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
      onPressed: null,
      /*onPressed: () async {
                          final User user = await _auth.signInWithCredential(_gCred)
                          await _auth.signInWithGoogle().then((value){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                          });
                        },*/
      child: Image(
        image: AssetImage('assets/twitter_logo.png'),
        color: Color(0xff4D53F0),
      ),
    );
  }
}

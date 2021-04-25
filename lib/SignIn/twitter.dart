import 'package:flutter/material.dart';

class twitterLogin extends StatefulWidget {
  @override
  _twitterLoginState createState() => _twitterLoginState();
}

class _twitterLoginState extends State<twitterLogin> {
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

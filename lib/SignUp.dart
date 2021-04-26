import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cogent_ecomm_app/InsideApp/InnerHome.dart';
import 'package:cogent_ecomm_app/SignIn/facebook.dart';
import 'package:cogent_ecomm_app/SignIn/google.dart';
import 'package:cogent_ecomm_app/SignIn/twitter.dart';
import 'package:cogent_ecomm_app/OuterScreen/ResetPass.dart';
import 'package:cogent_ecomm_app/InsideApp/firstScreen.dart';
import '';
class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  FirebaseAuth _auth=FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final _email= TextEditingController(),_password=TextEditingController(), _repass=TextEditingController();

  bool isLogIn=false;
  FacebookLogin _fbLogin=FacebookLogin();
  User _user;

  final GoogleSignIn _googleSignIn=GoogleSignIn();

  @override
  void initState(){
    super.initState();
  }
  register() async{
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email.text, password: _password.text);
        if (user != null)  Navigator.push(context, MaterialPageRoute(builder: (context) => firstSignupScreen()));
      }
      catch (e) {
        print(e);
      }
      }
  }

  Future _handleFBLogin() async{
    FacebookLoginResult _result=await _fbLogin.logIn(['email']);
    switch(_result.status){
      case FacebookLoginStatus.cancelledByUser: print('Cancelled by User');
        break;
      case FacebookLoginStatus.error: print('Error');
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
  Future _signOutFB() async{
    await _auth.signOut().then((value){
      setState(() {
        _fbLogin.logOut();
        isLogIn=false;
      });
    });
  }

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
        //Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
      }
    }
    catch(e){ print(e); }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15,bottom: 40),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25)
                    ),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20,top: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('app name',
                        style: TextStyle(
                          fontSize: 27,
                          color: Color(0xff4D53F0),
                        ),),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 280,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Email id',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff4D53F0)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 20),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 0.75)
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: (input){
                          if (input == null || input.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  /*Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 20),
                    child: Card(
                      elevation:5,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 0.75)
                              ),
                          ],
                        ),
                        child: SizedBox(
                          width: 310,
                          child: TextFormField(
                            validator: (input){
                              if (input == null || input.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white, filled: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),*/
                  SizedBox(
                    width: 280,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Password',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff4D53F0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 20),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 0.75)
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        validator: (input){
                          if (input == null || input.length<6) {
                            return 'Please enter atleast six characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 280,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Re-enter password',
                        style: TextStyle(
                            fontSize: 17,
                          color: Color(0xff4D53F0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 35),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 0.75)
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _repass,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: (input){
                          if (input == null || input != _password.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
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
                        onPressed: register,
                        child: Text('SignUp',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                          ),),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 290,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => resetPassword()));
                        },
                        child: new Text("forgot password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    width: 50,
                    child: Divider(
                      height: 20,
                      thickness: 5,
                      color: Colors.black,
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      fbLogin(),
                      googleLogin(),
                      twitterLogin(),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffBCE0FD),
                    borderRadius: BorderRadius.circular(25),
                  ),
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signIn()));
                      },
                      child: Text('SignIn',
                      style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
                ),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

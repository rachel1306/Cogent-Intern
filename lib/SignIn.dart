import 'package:cogent_ecomm_app/OuterScreen/ResetPass.dart';
import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/SignUp.dart';
import 'package:cogent_ecomm_app/InsideApp/InnerHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cogent_ecomm_app/SignIn/facebook.dart';
import 'package:cogent_ecomm_app/SignIn/google.dart';
import 'package:cogent_ecomm_app/SignIn/twitter.dart';
class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _email=TextEditingController(), _password=TextEditingController();
  checkAuthentication() async{
    _auth.authStateChanges().listen((user) {
      if(user!=null){
        print(user);
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
      }
    });
  }

  @override
  void initState(){
    super.initState();
    this.checkAuthentication();
  }
  login() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        final User user=(await _auth.signInWithEmailAndPassword(email: _email.text, password: _password.text))
            .user;
        //await _auth.signInWithEmailAndPassword(
        //email: _email.text, password: _password.text);
        if(user!=null)
        //Navigator.of(context).pushNamedAndRemoveUntil('/welcome',(Route<dynamic> route) => false);
          Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
        return 'Signed In';
        //User user=result.user;
      }
      catch(e){
        showError(e.message);
        print(e+'this is the error');
      }
    }
  }
  showError(String errormessage){
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Error'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                //height: 800,
                child: Column(
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
                          onPressed: () async{
                           await login();
                          },
                          child: Text('SignIn',
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => resetPassword(),));
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
                        indent: 150,
                        endIndent: 150,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => signUp(),
                            //settings: RouteSettings(name: 'SignIn',),
                          ));
                        },
                        child: Text('SignUp',
                          style: TextStyle(
                            fontSize: 20,
                          ),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

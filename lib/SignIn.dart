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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
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
          child: SizedBox(
            height: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Email id',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff4D53F0)
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Password',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff4D53F0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
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
                  padding: EdgeInsets.only(bottom: 20),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signUp()));
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
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: null,
                    child: new Text("forgot password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15),),
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 5,
                  indent: 150,
                  endIndent: 150,
                  color: Colors.black,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => home(),
                        settings: RouteSettings(name: 'SignIn',),
                      ));
                    },
                    child: Text('SignIn',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
